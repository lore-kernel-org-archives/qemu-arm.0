Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp102363lfu;
        Mon, 4 Apr 2022 04:03:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs1h5QU+B0orwQ2pkLh1AVPkkrAhvDLC7ek8ZmwDCurHP0ET3LWKh1qPDgC9tXjUxuBgpZ
X-Received: by 2002:a37:9d49:0:b0:680:f511:3978 with SMTP id g70-20020a379d49000000b00680f5113978mr12970521qke.755.1649070194845;
        Mon, 04 Apr 2022 04:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649070194; cv=none;
        d=google.com; s=arc-20160816;
        b=wVAQ7oxb+uE26qvmAJeuYyuWrLH+VmSgIf2u3PaOFWviaHTMTnWXA/N5bShD9nLosa
         fG1NvOBIQF+y7e+nXvGYumOI17CKUs0Jos0IEnme0pk07iB6ODQE2OIEFzBPJWFRc2dE
         WCaHW5NOyW7TIGwDpLdSQhryOfDwWJImwwiF0bGQhTFD3uF8xZoJRNgIl8cI0E/EiIjC
         DABWhm8PwrcZiUQ6InYpmFJ9+r3wwpwVtkxmSMpQrLG/+rfPRaxy7LZY3FhlH2fJ88vy
         4D641JRqsDrsfithsSqfstqBDIPPON3YG/TwVg68z5lOd8tLvQnYRA8Vl4ipFmzudt/d
         71IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=H1XwW/NhOAPUn3cY23zazn67TPlhMOf/gmFe3OeKk2I=;
        b=TGq/jeCFeKKQROzIIo9imVg4+qTJnzP56rsKW4e6/MX8R5mmxSxghgeEIpkoUUFCEe
         M8RqfsCHDqzP8+c9FclhLLr4PpwLn58nxjg7AX2V9mPOv+mklNFofmyPdMp6Orm7gMEa
         VkuUWq65yckIKXEnt6w6jk+PhO4zPIULp2IoO8petYiTVMs0ZgbjZwgbw0Hac4l+lJV1
         ErYLA3Wf8dE69xEVmPcHZImwKkJmFmJAA3itGH5U0q5sr/uJuGaKJ28Mr9U112IsBaLp
         EqvgDgHHPQ2Vl8bhDjP+FP55w8Q3DrhpxH6xIp0AFn6NvcBONSunwhwy1dn3Hz//Ko6b
         opZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=RR79StKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17-20020ac84f51000000b002e1fbf3bf64si2875334qtw.341.2022.04.04.04.03.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 04:03:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=RR79StKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbKUM-0001wl-8i
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 07:03:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1nbKU3-0001vl-5D; Mon, 04 Apr 2022 07:02:55 -0400
Received: from [2a00:1450:4864:20::22f] (port=42954
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1nbKU1-00088z-O4; Mon, 04 Apr 2022 07:02:54 -0400
Received: by mail-lj1-x22f.google.com with SMTP id c15so12324129ljr.9;
 Mon, 04 Apr 2022 04:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=H1XwW/NhOAPUn3cY23zazn67TPlhMOf/gmFe3OeKk2I=;
 b=RR79StKUaufACzJ/m7S9H2SyXXV4S8DWTJRb3EJ3S415ocEIzbPU7LS8LVrQ6+bEyn
 Tkg3YUAmCXvQb1w+W2hMPVv8Gwrm7y1vH9aHntS75YcgRAwUOBwxJmbRMIVLAD0K/z4C
 qxoSyxA6ECMGTiIukVNZUj9LNiQmdD5CEKppBf/ZCbAD5zarTwERLWW+1emGxjRY64kC
 vq5xNNTuZu+4qDup1Y8gz5kJCwD5FLfDdXGDGLR28gmrfWJ8DXOEsfjEIKALox5Mgkxk
 H9nQwcwuOjH+YQ8+QoVO4zhENf03Ivj1D5gEM4mORTQT81ga/xrfjsegnknSCTPtWaZC
 ovGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=H1XwW/NhOAPUn3cY23zazn67TPlhMOf/gmFe3OeKk2I=;
 b=yrHgymcenTJKoXNu/JYNGomIjgh4lAUr/SB6RV1NonMNXLXRGcT6lTYXJM7To12Sj2
 QhZkRQzaqQSkeXTl0WnvfqjTIGG/VgIsL72t52Bq2mhxKSk+B33YChyzJZJAtx3QiS3N
 oA8/TGKxf9K+JIev4QRkltR5cWYA/u8aD1etzXLqsaYil+cZTuihhsNE3NDrFIIWU1je
 8EpypjfD8DrMfSarbdgoFzxY10vPGS8811C6ZbDAHN+KUag/VshLG/yOmTGFny2atqMQ
 tc4cS6UVLSJ46WAFUFSUVUXbErAQoNqYr3zkOuid/uQvHDfr1vv8UMYqYfuF1/n88rP5
 HxAQ==
X-Gm-Message-State: AOAM531H7LjSs6rkQPTPfqdQAGSJbOpf5qXSFuPRZF9c/rL7XIq2a4tS
 L0yXaU6YaoLARvrtlzNCLSc=
X-Received: by 2002:a05:651c:17a3:b0:245:f39e:f2d2 with SMTP id
 bn35-20020a05651c17a300b00245f39ef2d2mr21819087ljb.490.1649070171310; 
 Mon, 04 Apr 2022 04:02:51 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a2e9ecf000000b0024b0f17f790sm704881ljk.21.2022.04.04.04.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 04:02:50 -0700 (PDT)
Date: Mon, 4 Apr 2022 13:02:49 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Tong Ho <tong.ho@xilinx.com>
Subject: Re: [PATCH 1/1] xlnx-bbram: hw/nvram: Fix uninitialized Error *
Message-ID: <20220404110248.GA2422@fralle-msi>
References: <20220401190631.1697408-1-tong.ho@xilinx.com>
 <20220401190631.1697408-2-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401190631.1697408-2-tong.ho@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -1006
X-Spam_score: -100.7
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-100.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4O029EJXIUbO

On [2022 Apr 01] Fri 12:06:31, Tong Ho wrote:
> This adds required initialization of Error * variable.
> 
> Signed-off-by: Tong Ho <tong.ho@xilinx.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/nvram/xlnx-bbram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/nvram/xlnx-bbram.c b/hw/nvram/xlnx-bbram.c
> index b70828e5bf..6ed32adad9 100644
> --- a/hw/nvram/xlnx-bbram.c
> +++ b/hw/nvram/xlnx-bbram.c
> @@ -89,7 +89,7 @@ static bool bbram_pgm_enabled(XlnxBBRam *s)
>  
>  static void bbram_bdrv_error(XlnxBBRam *s, int rc, gchar *detail)
>  {
> -    Error *errp;
> +    Error *errp = NULL;
>  
>      error_setg_errno(&errp, -rc, "%s: BBRAM backstore %s failed.",
>                       blk_name(s->blk), detail);
> -- 
> 2.25.1
> 
> 
