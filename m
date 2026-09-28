Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE040CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 18:38:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBGEi-0003MU-9O; Mon, 28 Sep 2026 14:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBGEf-0003LQ-3M
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 14:37:58 -0400
Received: from mail-yx2-x0d.google.com ([2607:f8b0:4864:41::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBGEd-0006rf-J1
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 14:37:56 -0400
Received: by mail-yx2-x0d.google.com with SMTP id
 956f58d0204a3-6740dd8b4b0so2996460d50.2
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 11:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790620673; cv=none;
 d=google.com; s=arc-20260327;
 b=hI3nDS63eBe9CZswo5dvdj+H9QShz99fqsYOMJ1vXlON4xr3sIcm/oaWi+UKgoW2tf
 FZKIXWyC015DvOjaVoQVMYH3CSvDlEKANCr4Xib0Tjk+VlDB7l+e5x3BxMdwtjviUOup
 u+zEM/21vFKo8fYkTmZZewjyQmN5MQOLe81Et+IM4Ju3mXpBtIE7xJOpYa7C7rx29aCn
 X3iEtVNauQlPltwboQmOPCPzWGgAnAcJ9bARbz3EisKwjOFl5oio1Oxr1kA5rA7LXk55
 DwhLyopgE1GJSMJL0kjn6QCHdJS3lkpamxkDRDKpAgnttqGL+7X96K8wCzPb1fkC1dWp
 Ywow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=onkNmPBNAKXX25Zkjof9Iti9cjLEDLXMrBB2qsjEEmo=;
 fh=qo0fykSVZR1IbLDtzoS3uME/nEeU0Wblym+EJxwfmwc=;
 b=WwC1HqCSF9h8DKuy2cFRN/CC7Zdta+44WHgPQicNN3ojNloX+3m+mbJziACFBDvEs7
 Tz0rE619rRCc9PaGMccQsrsC+phExEc8d5olSyCwH1U9Dxe3Bu0be9SaPU0S89pbNXyV
 9qJxIXuq3WAJNkkXoRmfGWpL771DDeSqK2nuBYrfmsLShT6ETBrrsKZg4sPj74VrV+C/
 yEqF1mPyv2VZEtKVpYxlseVFpMd70fr7NUigCaISJnenZKF5Vwup+DOpXAT+cJPNjuHN
 qgJn21R2UkRvnv9ySAkZxm5Za3sMyp8tWStnN9MUip1k71l3a/F7dr1LDu8ZtFgPOtF2
 Od5g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790620673; x=1791225473; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=onkNmPBNAKXX25Zkjof9Iti9cjLEDLXMrBB2qsjEEmo=;
 b=yiDYYU48YMLRFnUkVIpY2R3LGZmuPH1mTPErnOmxuXAa1l/iUa0dZGCOOenuF+gZij
 8Wyav4832WGmX7AM0NcZiVhmTIPC6yhGq15Xpja8X/CIDqVkbGrL8uD9SInM+2pG66tJ
 9o796mygUbA9YnHINHgNOrle6EtBEgaM0OV93nwe9zPE2Mi0YVfmbsogp+Gt6l/0/sio
 hFANv5K5MCiw/utdG1UhEsrUUwLOKkqzgIpx7OuMEJGzs0kBsD7QS5JozuNLlZIYvdfc
 I8PsemPMjmVzuNZvs/mRAztZvY7+I15uOeiqxBUwyihLvGg+YJw7BGcRvtHgAlMHjdtv
 TnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790620673; x=1791225473;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=onkNmPBNAKXX25Zkjof9Iti9cjLEDLXMrBB2qsjEEmo=;
 b=vsPCln1tMxlU3sKvPKiYgrEVeyuf1Zu+XwfjteXzQajkZsLydemPjhIfTpbSltZZc0
 dqp75N6kOljHrCJ/dZXNop0u1cghTxVrjPwwFStXVrYZm7KPTX9S1zG/s2bPPWe/ZPNR
 zHpgBiyHsfoIgBBZV+hkHKfn1s0tEgZfjquZUn8QyVCssftv4Q9Hlkj3fyvRvRQE52n1
 XfMXNP/6eu0yYyjeSGvXA2RMo+b41+3IaF3i2KlfkTiesMX3eDxvHiy0mRhBj4oVrgrz
 FHh1ZQ/UABWVBJiTzXAZ+1ol1i3G5kJw7OeuJ9Hc4R+bI9hlM8xHCSEKLv+V+HsYoOXK
 X6ZQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzQg9QYrebZA6mTsx+ucclbhHN8h77P1YZ8Y43fY3hcyYLxshxzE5l//0nkttgYOaI1vJULUhL9Pg==@nongnu.org
X-Gm-Message-State: AFq9FYLdLXlHW4maI8niG9vP+9aajM3XFM9iZOeAmVtuBkykjSFG6f5A
 n2kL2R3j7WlZugntpB7HeinRzsN3xOke+QoawsOsbNHdrWl5hQMG8rSy0MAhuglt/KQpz7QRxOL
 fzefykIMRckJh2BQ/QZgAIPUWE+DMNZkvdE2fv/lh3Q==
X-Gm-Gg: AYBFou02dM1Iwrje7p0vodXnwoWg6i2hG+yRKw6Eg10igjIiyhwthuWb5h5W1VWhb4r
 6kPSqHS1EkVOYADhbzcJkVmwfXj0PC7NMUjgxhvkIMz3EayxSxBO3nccK2j8U8DEZdumnHIfXwf
 dqoX1ILl4qHVFmY+YWXPXZmUyOR4EYNaLfN0K/8T1ebHxvjHwM6y7CLRJoXD5FGhR84jciYonMM
 PaURMevanxLqelKkPZuwcwjsCAb5RnI27N7eGLjBXz0vsocHeXrp6LmnglQq0iMM3nbc0uB71xx
 4bYDyiftqTC2hZF1Haa6lLN+CKCv9pjOLSSWZFQ/3m+r+22gvSk7VpiGJHZ8LrLCmIxNfpthWne
 tnK8hn3aXVDcF7XUfoVyNDu8KmbIODV/j6ItH1AU=
X-Received: by 2002:a05:690e:b42:b0:673:2e60:9eee with SMTP id
 956f58d0204a3-6732e60a2c8mr5481745d50.63.1790620673381; Mon, 28 Sep 2026
 11:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260921214710.29422-1-shentey@gmail.com>
 <20260921214710.29422-6-shentey@gmail.com>
In-Reply-To: <20260921214710.29422-6-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 19:37:40 +0100
X-Gm-Features: AclHuK-wwNgyHZ4mNCFW6UJj2vsq_B9GI77iOBHIu9g_IZ4wuIZhaRzvz3-djZ4
Message-ID: <CAFEAcA-88QGdjytopOhrLRJBqnZUsUVevqF-dVEwCNQQDsL9qw@mail.gmail.com>
Subject: Re: [PATCH 05/42] docs, tests/functional: Drop redundant CLI
 arguments in imx8m*-evk invocations
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Alistair Francis <alistair@alistair23.me>, Alexander Graf <agraf@csgraf.de>, 
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 21 Sept 2026 at 22:47, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Both boards provide defaults matching real hardware. No need to ask
> users to repeat these. Also, remove these redundant arguments from the
> functional tests such that the defaults get tested.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

