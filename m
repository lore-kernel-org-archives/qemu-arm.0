Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6067975lff;
        Tue, 10 Dec 2019 08:49:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqz1KqSw/WhVNTcRlJB33GvrCBJjwXJA3Z4ZG8T7n/waPjwC7/j6HhE9JFhB2J9LpDiDGjHE
X-Received: by 2002:a05:6830:1353:: with SMTP id r19mr21446496otq.288.1575996563363;
        Tue, 10 Dec 2019 08:49:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575996563; cv=none;
        d=google.com; s=arc-20160816;
        b=Nbk0mkwUizW1nb8K61arMxqG4pOszz4Y77TulHlOm+GchdP7WOwQQziPBfVHzR7+gK
         nec1fgp66yqBLJKeDDeRXY00+UX91gSh4oNed+9DJ4dp1EZQ4JXIC84KgVXl6DpO19l9
         gtyxkYYRXWQUB29B8FlqxhrZniZCxgV5XrN0CZMTTjWtHPmCmaRV2OjJpR7j6oPIImea
         YPnaTYCYBvJLXnmSOtRT7V9OPe/HwijwiGTvdimtFJrautwDmxHa0Oev+3WGH6oeoTNx
         aIe4hTUpeQT8KKLYKj/2Bx+pquD17KVuh4Gju5/mPn0o106sQZkD7KUVb6s8p7UKU0wP
         rVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=LtrQYfJdcTkOs3pftjkEUGXoyOJMbtVXOFWCdr+C1OY=;
        b=Mig2JuGGy4iqeF4WXJqXYDJOtJbhPBS1Q9e4KJz63I4Kh+IKEWG8JK1ZfuF87+PCRp
         9wIsOKJP8+CjEPOxhQ3jGrovtA6Y4AV7Q2svb8BFkGTmL9kinZQMFAKsZlyyj0YUAN2m
         rkkzgr0Rtfo3t6sS1mU/GWUMMT/UIh79mYX07sXFB299cAd6j+VhxRauVO+dfsH7zhrr
         uyqEmyBOB4+Cs8avs7M93K3U3WxDl1gErlkHv5g1i4otwSZPAp14QSyQLJi5KDTum3GZ
         40mlRjRhbukIGiMoVXmAyRLeQwc7RrWFEHEdDbBW7mjq56XFBQDcQMIeIfZrbP5kytbu
         MhQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cP2GPmuV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a136si2241410oib.252.2019.12.10.08.49.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:49:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cP2GPmuV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieihN-0006zz-Nm
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59677)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ieifm-0006D5-1y
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:47:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ieifj-0005VW-Ts
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:47:41 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41084)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ieifj-0005VH-NM
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:47:39 -0500
Received: by mail-wr1-x443.google.com with SMTP id c9so20899216wrw.8
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 08:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LtrQYfJdcTkOs3pftjkEUGXoyOJMbtVXOFWCdr+C1OY=;
 b=cP2GPmuVUE7UNfgpHtT+qtVlOHHLBBq2Wn4i+ghjaISiVk6S3tjqIKxoKxPLmkPUtf
 H/IVjd6DInMah9YbnLyHRTnJA/DH67iu952gCAgOO8294jdcLuN7fpsCYQZnOkLvKuNJ
 I8jTkqA0QeFh6E5nVECXnK60JrlTeUA9suaRTGiAkNLItgQol/FnQl1DkSoRgd89Yldo
 JfCh1q4Jb6h+s0YDQ9I932jkgYq2adIaX44hVUYOFqdS55IOlJXL+4TN7+rVs7nG14ER
 SVBMc7uWbAS50tQO2qPMg/cHrdWK10MCNa8ASNGESX3ocFmq3dxAtE2lqsemgUWBeYFP
 0KGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LtrQYfJdcTkOs3pftjkEUGXoyOJMbtVXOFWCdr+C1OY=;
 b=Co7PJ5OotHS7PPTJ7BhAD/6ypQ0RuEAAZA71KmeY3JiEzd8DPmxkrGIhMpFEDCNt6h
 NPfqyRX7FBjVoVCCCTMmW8sW3RftiG+cPKhdlgAbTIdfdXXLTFEnNMSdbn89+oBmTs9G
 UUQicKMIOEkiSxxAkGs9zsGSuqOCDzEHa6gUxbnIUtL21vN16Awvnua2+yixCL9Mx10r
 Oey2ujMpXonBnj9ypPBZf6zVklyCuX60s1hlzxT33/n9CfSqdmXAf/CUoEwSyzltZBBA
 tVKDl1jddmi7W4ZiceAM2gQe+HaZhivSIFDWBxBWx4obbbtXAUUHLtXltHjwkNwjg5SY
 UcQQ==
X-Gm-Message-State: APjAAAXk2BzLW36oUc6LBh/fipk+iBCCvr7YKzvz+ecw5dQTOnT8c0j2
 pTyJ2+MWTunzua18Z6tcO4RtKw==
X-Received: by 2002:adf:81c2:: with SMTP id 60mr4248392wra.8.1575996458872;
 Tue, 10 Dec 2019 08:47:38 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id v3sm3759098wru.32.2019.12.10.08.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:47:38 -0800 (PST)
Date: Tue, 10 Dec 2019 17:47:33 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 16/20] hw/arm/virt-acpi-build: Introduce
 fill_iort_idmap helper
Message-ID: <20191210164733.GN277340@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-17-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122182943.4656-17-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g+XK4cBs8GCd

On Fri, Nov 22, 2019 at 07:29:39PM +0100, Eric Auger wrote:
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> @@ -426,13 +437,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          smmu->gerr_gsiv = cpu_to_le32(irq + 2);
>          smmu->sync_gsiv = cpu_to_le32(irq + 3);
>  
> -        /* Identity RID mapping covering the whole input RID range */
> -        idmap = &smmu->id_mapping_array[0];
> -        idmap->input_base = 0;
> -        idmap->id_count = cpu_to_le32(0xFFFF);
> -        idmap->output_base = 0;
> -        /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference = cpu_to_le32(iort_node_offset);
> +        /*
> +         * Identity RID mapping covering the whole input RID range.
> +         * The output IORT node is the ITS group node (the first node).
> +         */
> +        fill_iort_idmap(smmu->id_mapping_array, 0, 0, 0xffff, 0,

nit: the other calls use uppercase hex digits

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
