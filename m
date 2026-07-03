Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143B5C43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 09:36:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfaJ1-0006s7-A9; Fri, 03 Jul 2026 05:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfaIu-0006kE-5Y
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:35:25 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfaIs-0003a4-CW
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:35:23 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-66628618509so509639d50.2
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 02:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783071321; cv=none;
 d=google.com; s=arc-20260327;
 b=jmQ01ujBFfwbUdbT3UFRrarw+86FRvGbUBq5lgmNwZ8ti83ToSL559EwTYZ+2nDgpf
 oXLf8wrRyM8S9RWOyN4eZKBgW0P92yg34mdp0gYOgUBMgqzziYX//CHeHbMlf9c0LRA1
 +e7TQIc/7X3v6sMaCVl9f/TK4mUcEkbcqbtFp28b/C0aTSYsuI+FzSxAiV12mTNlWjNU
 4ZdIk3kdG6GJ+75AG63j9m60gKO1Yzg7OUwuQaSt+7v1noZYOVloz7FKcz8MTPXd9iz/
 +OVJypcg0ZlHjNkUw3l8pjqLHXVClKccH3GC6MpjJZQ/OC3HeKHFS7d2Sg/8YyYe0Cl9
 0vSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hioO9bE+1WS3nTG5w5OBsMRH2Z/v02bhxGRLciCY0hk=;
 fh=acPNrff4AXNClopeBnalKs6nbukF0byHIDArds6IIYU=;
 b=DqGVNEXBN+v4CkqRMHehivmvJDZo1jrZDrhfVJnggyeBRVzmm7GLD9oTFODo/BBus9
 wTP77FogIBHwRoeqUsIvF/q1yKlR4envv9dxXVmy3NpAuNhU50HuBwcqi7GjKmHSoFjz
 CrBOSzND2U6CrHWimhbumtLHlFXKTNCJ6ad9Er2YZSMfMDaeuOsgYbeMEwD1s648RG0E
 daC7cP/GXMKU/1b///3CRUmjdqG6AaaEENs2CMBUFWcVnQ2vC3TZbHpZmG8T6B72hl6c
 9ARdt9AZ0EiKOV0BDvOeWI/XChvyWecOKTFF4rt/MAGkxg9HMyeIXtVGv7uK2vTFuVmA
 JBUw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783071321; x=1783676121; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hioO9bE+1WS3nTG5w5OBsMRH2Z/v02bhxGRLciCY0hk=;
 b=LMIpRI0VOpnUVeyeEme63KnW3uhUAeqUeLAJJcgMwJRHtIcbpj6k6iZQB0MiLmyyBi
 7FVPbfXqszqZNRJ3lGYv6P+sZx1+dhpKpxlarQAq4/UBYECc++5JG8C4BpD8AAN6q9w/
 dOaG6fuQcYAABTJbauunEaOqoJgoCHwlnC2DyRYBa/wqjTs5mLcHPa5TJee3SVrdLMwj
 NnqO+g9kv8YJgjGI8lFTQOgeS/GyAkeedZ3M8Lzlv3yv8VynHWZq8aJVWB+KAF/P8dAK
 oMWT0sGo0hDT/ZjhkvaeE6u/6ErKOwS45uhtrPqIdyxBEijyoUjq3haCHwyf7wbmMqAy
 AfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783071321; x=1783676121;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hioO9bE+1WS3nTG5w5OBsMRH2Z/v02bhxGRLciCY0hk=;
 b=oyx3WhHoBcoBkuxQAe3kZP6NbIGowqXa28NF6vMlJUU80DmPUIaj6slelsL7TvXnAm
 N4Znzv155zy+6ZI3H6OGaf3NYCbHDFGilySB96gXNzavBis/Uztyai84ttSrqm0q5h5X
 Izg9810zo5bpreVs+5vt6GeTi277rMccwZYi7RQx0r0EZPB7Uf2YZPvOquT8kLEZuvnF
 +qwLju7L07ztEhjp7zOVc64cb4gTmGupciybEK5iiAQ179qqj+uF37KoTkOxXakMMDpA
 gVRnc/5zA2dfjneL0cFVfP43xbZoVfO1k3iquxlh4XSQ+WKe8waaZteR9Km9tVLjsIlZ
 qHiA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqwoNFR9DymiVtkI/6E+5uxq611WM49GTN6q2DyPLYK+hsCU2dqwBXyVqAekKo0DT5TuCjzIwSMLw==@nongnu.org
X-Gm-Message-State: AOJu0Yx/v+mt0K4vm6XPoCLkSU7nUocCElPdOm4u+RylLMUKr9PpzqzU
 Cf0KFHT+YEtOaELIRp321HSyITCVKVS8aXTtHsq33z4omino88GW81mXrbj4hifi+BbYEj82/ST
 0KBj31FR6aL4c8eCLJChaVEP85M3QvRhG7TMP2uAmKg==
X-Gm-Gg: AfdE7cnwLyHfC3sjm4lQfc6uG7bpeUzcg/DiLsCbW0BLTtkixLrLeB3SJd7QoL1UFxe
 u6fA+164Gd1SukmSRXspPRo8UiD4SZ9Y6Smepg47+/F0zYI/LzsYzjqhmu1oUbJPcYcdgOfQ15O
 wbMGvsiycYMCBizS9jEYvXX8N5Ecciv9/U5YnSD7+FaLdyEU8Z5hfrctgK1sK+umPuHBnCXj3TP
 fKDovNkbdwTKG7bzP8res/5ME2FECa0w8u+t6/67lApAe1OWVT4HAZGaMcX5SmIIOt0SfKIGlqW
 IwVnDv8c24GamK1BVlIwosqk1qKT2fN+LNmQqcsLHdvgQuEqXVCBaNxC
X-Received: by 2002:a05:690e:dc8:b0:664:ea4b:d1f3 with SMTP id
 956f58d0204a3-66521958b68mr8729832d50.16.1783071320592; Fri, 03 Jul 2026
 02:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260626164819.770787-1-richard.henderson@linaro.org>
In-Reply-To: <20260626164819.770787-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2026 10:35:08 +0100
X-Gm-Features: AVVi8CcT-XeltYJlb6jq8lwmOzKit5cEXra6MwfyCHPkWQNMlB0LI9wYMXUdm4U
Message-ID: <CAFEAcA-1+Y70ur4x6OKuOt_w=fY=Mnk72=Jy+EOr=bV9OUgKTQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Implement and enable FEAT_SSVE_FEXPA for
 -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 26 Jun 2026 at 17:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> v2: The enable test for this is (FEAT_SVE || FEAT_SSVE_FEXPA).
>     I thought maybe writing it all out like this is clearer than using
>     TRANS_FEAT_STREAMING_IF with a one-off combination feature test.
>
>
> r~
>



Applied to target-arm.next, thanks.

-- PMM

