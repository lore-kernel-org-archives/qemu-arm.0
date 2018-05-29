Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3523524wre;
        Tue, 29 May 2018 05:43:16 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJNVjWxkISczHDFaRX/+sGm9svG7S65wbtQLSBnwhEsRj/zwEjVXljFP3O459yATrGWcaSJ
X-Received: by 2002:a37:7183:: with SMTP id m125-v6mr14459919qkc.107.1527597796771;
        Tue, 29 May 2018 05:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527597796; cv=none;
        d=google.com; s=arc-20160816;
        b=cJlvTBAfN6DQFiGCDq51p4eeUo+RINzBNnVSBZbL6V9HBund+YcUSx3kszIAQ6UnvK
         GD8fHGEKoBV0BXBD5hZDYG6rK182gwVXAoxgv+SDXz4r2hjJ3qv1s0+PTzTay0iEsvi8
         adnY9tzFs0p5l+Iec4i9x/IfOziAmEHXmWhi8ap7nkVaxBvhA6Ct+cRCfaLXB9O0QySL
         TpT/mBFjzQh2j67kOmA2syX+cLMAiIwzwQIHIAIlKqDil9GARWfASJz2NE4UquIyzslf
         in2CWmzMylD/Y24/S95sx/+AAXxDuQlX9OApuWDtEGidBDBGBAarvRCp/5AepHRXIQzI
         mhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=4PSuRKFfBJ2WQ25uxLMD9Ilh9yTf8YAd8m4yeZbvvUY=;
        b=Ag7PFf33yVGlyoICkK7EPDmnRhtLb25V4m5ReLGXslrXZCjOJskFTsNqvbLbsKKOhG
         DWPzB/jsA9fJMIo8lG+PB79stfGJD2RKr7upn1Sa0E/VYkdntJQC2hShile5nFvXGlW6
         h8M1pg3crpCP8CUQocEvbfNodQ9/gQtRpSdxgarHv9WuVbC42069zjl+/Qki7NUrnUVW
         y4n9TP582iBc39y1AGzIsHVUMEfkjCMSE+RpMI6EdUPkDFYOmbhhGMe86L66LDnxYv8C
         ImtbXIj4xb2/2GtmpHNdynlYRIAqEy6tLAzx1xkz7KSN9IoFSJyjob0izOAYEa0UcFvU
         ORQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YnAtBHXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c25-v6si7449157qtq.389.2018.05.29.05.43.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 05:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YnAtBHXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNdy8-0002jC-9r
	for alex.bennee@linaro.org; Tue, 29 May 2018 08:43:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNdxx-0002hB-DZ
	for qemu-arm@nongnu.org; Tue, 29 May 2018 08:43:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNdxw-0003xg-P8
	for qemu-arm@nongnu.org; Tue, 29 May 2018 08:43:05 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35557)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNdxs-0003uK-EV; Tue, 29 May 2018 08:43:00 -0400
Received: by mail-qk0-x242.google.com with SMTP id d130-v6so5907744qkc.2;
	Tue, 29 May 2018 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4PSuRKFfBJ2WQ25uxLMD9Ilh9yTf8YAd8m4yeZbvvUY=;
	b=YnAtBHXHP3ECx8jDmOb6wveXy26pvcWuvMhZGl05HTg4bfNyokvQNLR/24vSOyuZHk
	1y4E9Z9hUJ4yOrcPdebrbRvC958OfEH39kc1MRcria+pqGLLh4n3cLsf6POCqzlhZgKt
	eV25jCUjs7d3SREO4OZwHJukewNUt0wYCm38TT05HrG6tRN6tynD1swG5E5rmvU9cn7b
	FSU2Uq3lMrDXmBKfSUtHZ3yIhmJar7g0KXdR7St2pFsdr3XOwV52FK03czyIKyAUGAxB
	WH1D2xPxY61BRRhLyd+1FNS5E5EWJEX6fEWw5BofWsHw9TCIYWcGWUsibMEZTtVMM5Y+
	t0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=4PSuRKFfBJ2WQ25uxLMD9Ilh9yTf8YAd8m4yeZbvvUY=;
	b=DHQrQn7+U3UeHPnreXc06DFRTg1VTA2heMNDhM8k06uXIyNbs0Sp8yJsjdIhBUEVMP
	8fz1T6rtXtC7cndUdQHAj2si6DLtk/d45zhmFzPQl/H7BbZw90jOdrSNMHOFO5ZXnmek
	SxoPpTuHxon72Qdh5es+Bg2hVp9Ca+/y+29JaIF4KnDMzwNjLJxaWZ86al8K9J6F46Qc
	TdS2lDKMX7pljA8mSLm0dpG2q2AuAQqn2mefYvslgX/HXarlBQ1cEgvMdAp6Zrrt+yBA
	M/RJIfEW5FVPTkmqQSkgBoyIcl+eZDw8HL7jlwQuKRrnZu8l9r9rqUHS0ZjbXbHpQUZv
	CRjA==
X-Gm-Message-State: ALKqPwcMdhbNNcoGI4nfXxrSJSAw6KJGqU20u8wNrSVsqR1TYe+x4o92
	AonNPQojlg7sO5G1fqPBu8M1PtCmxVQ=
X-Received: by 2002:a37:5685:: with SMTP id
	k127-v6mr15210450qkb.264.1527597779506; 
	Tue, 29 May 2018 05:42:59 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	h48-v6sm26309376qta.43.2018.05.29.05.42.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 05:42:59 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
References: <20180529062838.20556-1-clg@kaod.org>
	<20180529062838.20556-5-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <cd33aebe-d1f1-20ff-45ae-642c3906edfe@amsat.org>
Date: Tue, 29 May 2018 09:42:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180529062838.20556-5-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/6] slirp/ncsi: fix "Get
 Version ID" payload length
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TNzEKWp4zVcW

On 05/29/2018 03:28 AM, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  slirp/ncsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/slirp/ncsi.c b/slirp/ncsi.c
> index d12ba3e494b0..02d0e9def3e8 100644
> --- a/slirp/ncsi.c
> +++ b/slirp/ncsi.c
> @@ -60,7 +60,7 @@ static const struct ncsi_rsp_handler {
>          { NCSI_PKT_RSP_EGMF,    4, NULL },
>          { NCSI_PKT_RSP_DGMF,    4, NULL },
>          { NCSI_PKT_RSP_SNFC,    4, NULL },
> -        { NCSI_PKT_RSP_GVI,    36, NULL },
> +        { NCSI_PKT_RSP_GVI,    40, NULL },

sizeof(ncsi_rsp_gvi_pkt) - sizeof(ncsi_rsp_pkt_hdr) = 40, ok.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>          { NCSI_PKT_RSP_GC,     32, ncsi_rsp_handler_gc },
>          { NCSI_PKT_RSP_GP,     -1, NULL },
>          { NCSI_PKT_RSP_GCPS,  172, NULL },
> 
