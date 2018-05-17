Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp160351wme;
        Thu, 17 May 2018 09:05:01 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrzW0wVHTt1B8X9YvAq+F6PmNYvmicpC6km5ceqNioNsQLaeoCm+RbUMKWzwWtfHVHp+ZAx
X-Received: by 2002:aed:2a67:: with SMTP id k36-v6mr5914458qtf.302.1526573101244;
        Thu, 17 May 2018 09:05:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526573101; cv=none;
        d=google.com; s=arc-20160816;
        b=aSdSvwo3k//TVNWTLyduSEuQzyOFdyGnQ0jPBRrHSgfdsw4f44IsodK57U8r8yKSg4
         iyGOf6JPuEniTiVmuBq/NvkwylaPBgjFMZMvs+PThe2GZKj7oDTeTR73GTS+DASOiJXQ
         SqQ9sxTAw+BMCMvK8LvnSx33Y0JPw2A0seke8OEC05SXyKEuPfQmO4OY2yl5mfXjPWub
         +23SsL2hGLahVNihhyIIddVDscPJX4EUy1Zc+nU0g9eLFBTTaGinhTCRxeiBFa5L4e34
         4giO4Boncr1FHeg3cDYGio5GXXHK1aj+Dfty8xGSpbhz15Na3UwOsBRV4M1x1uBB8k5k
         9iqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=s0gYKSAqDtNMntdE2GA/cV7kQXB3du+6bnecPJHIifw=;
        b=veccgy2LSPvlmQg5ZukH10eNPDouQ2L9I9gY72icWBTzn4FRg1hFdg1ZlLIA+qDKmu
         EbCTziX3+q764pDQ+eP6F3RQ5/ebTXCFZNSXIy49dDMjlYne8gUPsJLMv4KjazzNHG+R
         pHtdPUOLnFX34IXTH7X62cFsonrhz9HpoYgd/aeNKdfNuiSKJE1NHp4N0jW+VeBf8Z9w
         kJVORw2ON96FdSqO98FArdDgIKDsyuTbjBo/KU9J8squFqOpYAZfMLGke55aFFGh4qLz
         GveI6IkqrA+iokhQU9VIgqcR3LTLJvV9hj5GrXyg3GQN4FxtTD8QdGil9TUwEzCrXNZ/
         smnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X+iaXSHf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t19-v6si2806749qtb.266.2018.05.17.09.05.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 May 2018 09:05:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X+iaXSHf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34364 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJLOm-00045y-N2
	for alex.bennee@linaro.org; Thu, 17 May 2018 12:05:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJLO9-00043q-Ng
	for qemu-devel@nongnu.org; Thu, 17 May 2018 12:04:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJLO5-000394-SF
	for qemu-devel@nongnu.org; Thu, 17 May 2018 12:04:21 -0400
Received: from mail-ot0-x230.google.com ([2607:f8b0:4003:c0f::230]:36745)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fJLO5-00038t-O7
	for qemu-devel@nongnu.org; Thu, 17 May 2018 12:04:17 -0400
Received: by mail-ot0-x230.google.com with SMTP id m11-v6so5648907otf.3
	for <qemu-devel@nongnu.org>; Thu, 17 May 2018 09:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s0gYKSAqDtNMntdE2GA/cV7kQXB3du+6bnecPJHIifw=;
	b=X+iaXSHfWjKv4OGZpfD/Jvesqo5eKSM8+LirUquY7l6iZWJZY1sB584k5xS8ZFizeI
	gkpeJF5bbQziFPTdfmYwEfE68gF1DKUjysqgqws9G05G+BZM0YpAuI0w+0umbFmMdqpu
	7BGzz5xkazmo9F3ac49ntrIDbFCwreMtAacdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s0gYKSAqDtNMntdE2GA/cV7kQXB3du+6bnecPJHIifw=;
	b=dFGBK3m/y6jPWLe0WqBcrsX+yziILkcSmUCqduXSUmqOG5n2y1Q+a7f2NJ9R0EP3BK
	b9jpIqJxFE0JW200Lt42o2J9z14zaOV117TDAK8dxmdjNiX7T+SySgoXFuKkfsvqiuPX
	9dHpZfygEeSnlnfwFEHbbZxl4pUOlBpR2EN+M5zO67CAJgElk5dYosCLBj+nrIBn0SGD
	q0VbekdFXFREdi6d1S7Tes9g8BaRpbuwX/b5xav50iIIwOV6bKioWTGljbrazVP6IOC+
	+NNfMMeIls8mapmE+65CPD0PnVePDuZMbqyCyWwhhkzfQLAS9bURJAGJ0GQldCsln/4f
	u9hQ==
X-Gm-Message-State: ALKqPwfNsAb9aACRytMvJEWZoUjnznn+4jhAZW3zqMvy3rmstnAcBUiD
	Dx7SMPw6A9WC+J/naC4LugwzSRwLbTrio5HVjz3m5w==
X-Received: by 2002:a9d:255b:: with SMTP id
	j27-v6mr4257955otd.316.1526573057111; 
	Thu, 17 May 2018 09:04:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 17 May 2018 09:03:56
	-0700 (PDT)
In-Reply-To: <20180516223007.10256-9-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
	<20180516223007.10256-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 May 2018 17:03:56 +0100
Message-ID: <CAFEAcA8ATbdfprPZRJmPjF_KBnnBsmrW+kH6Cm2_8QqGufQkAg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::230
Subject: Re: [Qemu-devel] [PATCH v3-a 08/27] target/arm: Implement SVE
 Integer Binary Arithmetic - Predicated Group
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ng4/0vZUwRw9

On 16 May 2018 at 23:29, Richard Henderson <richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 145 +++++++++++++++++++++++++++
>  target/arm/sve_helper.c    | 194 +++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  68 +++++++++++++
>  target/arm/sve.decode      |  42 ++++++++
>  4 files changed, 449 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
