Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp105840wrq;
        Thu, 7 Feb 2019 09:42:51 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYlB/p2c/LhsoFaO7jW22/IQg9PJX051doyscbh9Y13WuUALhPPVr7KOXQ2OkPHHRsPltHL
X-Received: by 2002:a0d:cd82:: with SMTP id p124mr14205492ywd.267.1549561371145;
        Thu, 07 Feb 2019 09:42:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549561371; cv=none;
        d=google.com; s=arc-20160816;
        b=KlR111B7ymcCY+zuD2Ou6MWKWDSKUmjXK/hYB6oprPJwwp7BKL35Gj0y57pjsx9PD2
         s01y9VmJyergz4o3i+RCC9SkyUaT82HJaeETaWryHS64l84Ef+qVO29yckVmMGhoXdeG
         jurknlWhhA6vKrX5Tv2uCN2jJ6mu6+zExtzXaDKNKYG50VHA05kb0Ui9R+XzhEPAM3z4
         JSaWaAwKSx5WAPJ0jQcB9ThTA9liKhKwHsRw59Gql6PpjiA+7d+9cETJ3ZpxLMjZl9Xb
         4zub+S8L/akrtGlI8B+5ParnUuZYMSUzhGNJw0MFyoAfrY53AkNZycocfgxvNhytwuS3
         YQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SCkZ0w3yXVZSETIAzUCjzdDJzFUIagtCySM/+nWTpk0=;
        b=Rb9L7o/UEijzmnyf5+E/C5FnEnXlvmosVOW0UXsHSctoK9XsL5yjiex1aYoE7Vrbd0
         /6sdbBCTWHVQNnKwJcPUtATHosgsXdFhkUhHjtPqzXoCTiFgHHe7v7tJxT4unZKydW87
         Mh/Vl/RKaF/B+Ex6psLnyZ0brUiOqwZ4JezR3T5aSe8ujSQfPBjizjsw1NYyXVdA1BPW
         9sG+lf4ZsGpLedS/jrEL4zXt5RXneoubgfurFweqq/rhIUIJLlrgTd2kOAFHgV2PbZyg
         AyOEgwYuWr+iWPmFhjBA0PDyZFkb5eZFGhRJa0rbgqztRgg9Ru4ahcT0SWZlOS/vZXZQ
         cWiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z1DKo7o1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y62si765690ybf.461.2019.02.07.09.42.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Feb 2019 09:42:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z1DKo7o1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grnhK-0002HC-K7
	for alex.bennee@linaro.org; Thu, 07 Feb 2019 12:42:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grngk-0002GB-0S
	for qemu-devel@nongnu.org; Thu, 07 Feb 2019 12:42:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grngi-0003Pw-8V
	for qemu-devel@nongnu.org; Thu, 07 Feb 2019 12:42:12 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34617)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1grngi-0003Pe-2a
	for qemu-devel@nongnu.org; Thu, 07 Feb 2019 12:42:12 -0500
Received: by mail-ot1-x341.google.com with SMTP id t5so1274730otk.1
	for <qemu-devel@nongnu.org>; Thu, 07 Feb 2019 09:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SCkZ0w3yXVZSETIAzUCjzdDJzFUIagtCySM/+nWTpk0=;
	b=Z1DKo7o15InNhYXYBHLVTBnu5n2jXt8eKa24mm9ssJTF71+RX2AdHti/w5OoprDElY
	+ev2K+NG6+WcFsm3kc5vzFJDxafhUlC7T8rnmxdVrSgitbxeP/+HVf0Y7m+/8G/XxYTZ
	d1Pz23oZeui1+JP9HreUeSqUvNpL+5jdjx/XNv/hoFG5MiXV5Z04RspL63//MGyoXfD6
	/z5kgyK7SjLZQKCyr3Di3jqAReufOawKBusnMmnsiXE+Ow2SG2YQsjckOcUBAh1xBCPF
	ohGM7/2icxE5Vu4yPafNIBYFDt5z2Acvk7L2/TnuscfSkfKfAaUiU1btLb3xb6way+Rf
	QZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SCkZ0w3yXVZSETIAzUCjzdDJzFUIagtCySM/+nWTpk0=;
	b=iYMO0zdzKiboKiWM3DAB+sMdcgtsn4EKnZPtEgpqukoCN5nqiR/SvE832YwG7j5Lzn
	Crj9hQd2bjnjIKUJIW5owQaz3q+7zTiRXbRe170O20tdUAdsha/MKktpKtjQIRr5ddnl
	OX1dI96PEWNlrMMmm1tKJJnO9/+NcP61WDhXDcrFkD0zEFe4O7E8glfigdx6Xo3mCDNt
	5d/UQKzZvYOYLh4VAJznHTCRdBw3H5L6JWyYwewbZ0b/A1CIAeZo1NikhEebJry2Y5Ze
	9du2yy7V6xpoZXt1cl2oJS6GMHzCcL+cMzaqTwyGecgtWH8dQOXr7qhZtc0qhF/gMObz
	mR8A==
X-Gm-Message-State: AHQUAuYjtUo/R2qMKcCtI2YdWBnwtSrvhL5ohaZ78HcXuZQjK/eMTvS4
	TfQTaGUE+ARxSazxypWdaBSml+k5a8pGNrLVRMk8Kw==
X-Received: by 2002:aca:2801:: with SMTP id 1mr970763oix.98.1549561331513;
	Thu, 07 Feb 2019 09:42:11 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-12-richard.henderson@linaro.org>
In-Reply-To: <20190114011122.5995-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Feb 2019 17:41:59 +0000
Message-ID: <CAFEAcA-YLZc1yqwucsyiPgz_qXLxaLB3pJUG7Jbdwp+fX03POA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH 11/17] target/arm: Implement the STGP
 instruction
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
X-TUID: dtg61EuXljLr

On Mon, 14 Jan 2019 at 01:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)

Same remark as for patch 10.

thanks
-- PMM
