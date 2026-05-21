Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFE9CD4F3D
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 15:32:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ5N5-00028U-JM; Thu, 21 May 2026 11:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ5Ml-00024C-Vv
 for qemu-arm@nongnu.org; Thu, 21 May 2026 11:31:20 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ5Mh-0000A8-Hp
 for qemu-arm@nongnu.org; Thu, 21 May 2026 11:31:17 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-6530287803cso6429859d50.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 08:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779377472; cv=none;
 d=google.com; s=arc-20240605;
 b=WMFrSC7gXGe+zm5pealZjMhhq7IxSBw5TozqUZsh4pNau0uQlnebs9nUJHiLPokOvx
 SyIf3aO8TGlVG0gntmsV/cJ96LOyAa3rWaDeVuDbF2OF3ozOqXnKEaH1bLzSLfvnHKik
 wlld4ibiRBH7aO5ggF6Vnc0lfOYcggx0q0ql1luRPboCDHJOTGv5rCdZBBOEuH0w9Rbf
 q7nYPCYJe3vplsN7r91d8z2osBHRpRdtX+eW2ubHyfcFqqQdYZ17bTa0/TH0x5BYMFCb
 WUEzoppWEv1zukG660Y9OJpBTaXJc3h9hHA6xKVPAwzC7Pt0ckQoVO4sZmbShSLM/fBj
 Kdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OAaWMWJwk63Rg4gmAAVrRYzsSGQ6Cp2o1ToLmKpl1FY=;
 fh=3TKiopGzQOCSIZrERVDTH7RnEBS9tKjvZf+e1IcGzpw=;
 b=IwzXx+kqU2WA7u9JEU3up3SgDM22QF9syvImJFZyLAp/jiqji6jNsjXDm61DMHjAYW
 i1ON3HyxBbBbFJF5AWFiL4T2cw8iD5VnG0OGYzh2p53AAVSqv6uYmlUSGAnH8chUcQxo
 /qYbAw451zdZho86u5MDGxwaZCy4cdtc1pkLuIJEt3tz9nZMzyQFDIW8rRDAyHrw3gul
 m/B8+t6+gnJobkU6SYqhi8PN1O1YY/0C8qKj/dj2a3t7Ooa4Ta3wklDHvc4kZFpT+ZsD
 iRZNQC2ZBuLXW/TRrysR8yDNjt+kW+fgEf3fTcasoEf3AYKBD6HCCTnm6lBLfhYQ8yJx
 mjOg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779377472; x=1779982272; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OAaWMWJwk63Rg4gmAAVrRYzsSGQ6Cp2o1ToLmKpl1FY=;
 b=DQnwYLNjdNCxBVKBEwJThRf6ZygmZLIjGHm2tF55kt7Rk68wTd074Zz/iWyVMVYTVO
 HtrXd4GLSVZvh0a/3ZeKnqrHZnjX/EgGmfE7YeMMkG6gUq/MmOvUna+d0nZHAmGxfaZo
 Xr8SvLSMbYoprDzkicb/12l1IvlgsjpaUo6IaNhXChH7YloJb/Jkdpp/UVBg14eKAvwM
 6GM18aaju4vHjbKD1DfOmWn5I0nP/W0sXYJaFuoy8oz6ntV2x6s36TUUkLq08aU43HjD
 x+Ff9MP54OFueXn59JlGI12V3DzEkHf9n9BjxQHA0sXqRIQ/II5l5BMEucvl34Q3onTC
 Lc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779377472; x=1779982272;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAaWMWJwk63Rg4gmAAVrRYzsSGQ6Cp2o1ToLmKpl1FY=;
 b=HKn/kecIWw2SSE1j5TZzCUkAZctyCsZCuKVlroCVbi3H7khKx42A9DHubrrbFGsEFU
 h/mpAwCDow0iuCjmLGbiYBXlCZ2RbogGTdhQWItfNcBN9M99SWj13nqxmsjYildH6Tl7
 Wil4NTnv/iJdOQlKFHB1PylMTsEspZvR2yvt2PB7Ax8NF+5UE2Iecd7IVnsiYxRu2ZbL
 NnqfNdXPcjTjs0ZxySEImA84a1vCrKPaQxdjdWVMI/N1v2mRHUIfJinm366yS7vUbTD7
 R0sy1MeCzYy+vmEs3Q0hinzGVYvKnNA3nGvvSMGaEkSzrQhIZiTsiOLh5DRSAKTmiTOr
 Pk6g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8tw9Hqgd2BdSZvvgRpj+WAVdwZ4LfPSb3fD8WVuhytnLP1Me0wuzYgZzzTBuvbBS+dJszJzwNjNA==@nongnu.org
X-Gm-Message-State: AOJu0YyXDqRDFvEt4D0scm+vFKHaK0jF+RxTCSRWbiCKIVGmN/+9/HB9
 Oe1zuJ8YJlYtF7I0qMrSq44SGjTS0DeO0rLKUd1tzDNZNwTfNByFRIfMkzyeuwWFOt47lFgmyED
 ApcG/O/MW5unU6mF5VNbSdU7AJl1n0wwHhG6JvDNbmw==
X-Gm-Gg: Acq92OFEOIV6wxQTgzfkFe9ChK7aiZfuY3CdGds3Rr/60vNarXzi0CdbHQoecjZTEGM
 /zhrv+idlY2rsaAeaJ7HU8jIixtYPHT5DYxyBRkPlrhmG6HrFOcywstawtE11YnN2Sp6lyWX2Yr
 zb+Q4bV51FnXsM/Vk1tK3uhTs9hWlK6BDdDy8gAU0GVtROcfS0JdxzheRQWMuUdKCJFpTKmKs/x
 MznSs7EB8Yes8ix9yL+fCt4o8djY6JHVRs7BD8qVZQ7KuDCb2674omQrw+f6bCgJ9pwlePA0F3w
 iu5Khu/qvb1eDlkRpE505hb6Lz62+LKlc5nqpojoRCy4O2xb/jLKjVokYHr+7uUtBZM=
X-Received: by 2002:a05:690e:d41:b0:65c:3597:5fd6 with SMTP id
 956f58d0204a3-65eae27d729mr2552878d50.48.1779377471480; Thu, 21 May 2026
 08:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-20-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 16:30:59 +0100
X-Gm-Features: AVHnY4L4xUa5jnTZQ36QnkqVzdnfi2DDBoG6gEl8ncYQi0H1pnECrsVQNgRbyRI
Message-ID: <CAFEAcA8xoMxi05C+YXqwHudbnBaW1uu44Eqv-JpX02F5qZ-69g@mail.gmail.com>
Subject: Re: [PATCH v6 19/64] target/arm: Implement FSCALE for AdvSIMD
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

On Wed, 20 May 2026 at 19:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

