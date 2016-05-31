Received: by 10.25.27.66 with SMTP id b63csp2276855lfb;
        Tue, 31 May 2016 13:34:52 -0700 (PDT)
X-Received: by 10.140.237.79 with SMTP id i76mr34784289qhc.43.1464726892428;
        Tue, 31 May 2016 13:34:52 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x22f.google.com (mail-qk0-x22f.google.com. [2607:f8b0:400d:c09::22f])
        by mx.google.com with ESMTPS id n50si3368330qtc.125.2016.05.31.13.34.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 May 2016 13:34:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22f as permitted sender) client-ip=2607:f8b0:400d:c09::22f;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22f as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x22f.google.com with SMTP id i187so12968783qkd.3;
        Tue, 31 May 2016 13:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=+aSLhQ0fWmV/FMke/4ITwrDXZcQ0ACRPUORGNoUxFU4=;
        b=ImNJBSFf0nTDtIFxWKHnGysfVN7sXlMUD2jt5fCq88/dmoFayANnvereCdLTOubuCb
         EPbOID1W2xOKyrFVG8XRij9ggRY5lDguyM8Vdn4yR6bJ40s6siTT6G86oRTx8H/YVDRX
         t76ZZUjE45pqkDM9mZbYmpsYJs+oZBtV4tS/TZlrhqxILUxQpYSgw5811qPAv8YsOVd6
         6z+K4D+GnLH8jg7BVt1JuU0FxxK3sSQWOcRmvdK59Lr3PSTENdNer59aXy5F+glD4FgI
         j1bjoIRD4IMjchGnfIQNHEkSz8Oq0x8R8V1GQ6aTzwH7/JxnAbZ6LHPz9s2vq2dyjb95
         hTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=+aSLhQ0fWmV/FMke/4ITwrDXZcQ0ACRPUORGNoUxFU4=;
        b=WKKBAPNKTAa607WPqCx6lPAwxF4felGL3CTaShidaifZxIOjHNr9hGN36neuRJ1Vhc
         3ivf5cfapnVELNvY0Ke+PLzQASe1ELW6YhCorq4xRIf+UhZpHQlyvoqXyIzsawI2DHw9
         3d/Le3YIVxjpls4blpexvhgXpi3Hoogqj8y2o649DW4ymKAsnSF33hY/m/+Zx+zG+21K
         hKz9k3kgmhH2sbli3/ayedl2sHnlVfe7TbMzjvJKU2IXzSAD+ZMJjFIOXs6RDXrjdrXu
         kw0M5FwRFy3IQJZUOJCE+/7gUP/eBlfz3v5XhK5hJ9NMrzR1jxEY0orcid/DdHo5caUn
         VCDg==
X-Gm-Message-State: ALyK8tL021h7ilkRDTa/hW3v+rHosrR7ByY7kRNqpaIXZopMdXWYyYPdXrtDPn5eQP6uZA==
X-Received: by 10.55.24.212 with SMTP id 81mr28568485qky.146.1464726892080;
        Tue, 31 May 2016 13:34:52 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net. [71.37.54.227])
        by smtp.googlemail.com with ESMTPSA id b34sm11535982qtd.32.2016.05.31.13.34.50
        (version=TLSv1/SSLv3 cipher=OTHER);
        Tue, 31 May 2016 13:34:51 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC v2 PATCH 03/13] tcg/aarch64: Add support for fence
To: Pranith Kumar <bobby.prani@gmail.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 "open list:AArch64 target" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20160531183928.29406-1-bobby.prani@gmail.com>
 <20160531183928.29406-4-bobby.prani@gmail.com>
Cc: alex.bennee@linaro.org, serge.fdrv@linaro.org,
 Claudio Fontana <claudio.fontana@gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <6685558a-6774-778f-a8c6-b6e845eb5ae4@twiddle.net>
Date: Tue, 31 May 2016 13:34:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160531183928.29406-4-bobby.prani@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 7+NYeAuUk9g5

On 05/31/2016 11:39 AM, Pranith Kumar wrote:
> +    /* System instructions.  */
> +    DMB_ISH         = 0xd5033bbf,
...
> +    case INDEX_op_mb:
> +        tcg_out32(s, DMB_ISH);
> +        break;

With the flags argument, this needs to be split.

DMB_ISH = 0xd5033b8f
DMB_RD  = 0x00000010
DMB_WR  = 0x00000020

	if (a0 == TCG_MB_READ) {
		a0 = DMB_RD;
	} else if (a0 == TCG_MB_WRITE) {
		a0 = DMB_WR;
	} else {
		a0 = DMB_RD | DMB_WR;
	}
	tcg_out32(s, DMB_ISH | a0);



r~
