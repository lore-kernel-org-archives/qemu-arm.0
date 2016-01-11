Received: by 10.25.134.130 with SMTP id i124csp1897943lfd;
        Mon, 11 Jan 2016 03:19:14 -0800 (PST)
X-Received: by 10.28.133.141 with SMTP id h135mr12443540wmd.70.1452511154117;
        Mon, 11 Jan 2016 03:19:14 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com. [2a00:1450:400c:c09::22d])
        by mx.google.com with ESMTPS id k126si22242639wma.23.2016.01.11.03.19.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2016 03:19:14 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) client-ip=2a00:1450:400c:c09::22d;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22d.google.com with SMTP id f206so207054938wmf.0
        for <alex.bennee@linaro.org>; Mon, 11 Jan 2016 03:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=yW/CBTxCTpgb43trWcEnFkVUPaMkEGZA1eFmCPQCItU=;
        b=ing3N9Dlxxfg07WxN0N+agRcv7QD/VY53Il7xe4r1pYg2MXIUnFlbms/QCdf59+Wdk
         hlzsNC0/cAaN/Zf//m1Ue8xN/szv4Aynp+Ri55Y9mt4LhXr8OsFW9WNJ3Ca8c4FO9mln
         0DGW+3adPsLdVh4RnFFeMnXpjfi+SUwioKkGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=yW/CBTxCTpgb43trWcEnFkVUPaMkEGZA1eFmCPQCItU=;
        b=RYwa0WfI7RXXAVLUrj59iw0lTfdRDCCg9+/PAih2T6wF7kzqDmSzqV1Gnb+nilRIhu
         oawgBw+NfAvGUhV/56uwuBvSbkaFTepHKV9HP4CWIOialcGDfPiwp3txIUw+uRbxjrC/
         +VfX0zkdir9RyqkiSkW7o4HOyYUjdOVMyXRu9sEcgI92aPFhz/X5owKsXTm0j2y9xrWx
         x8ebfxLyZKq8qmsAT9YVTcQvPAuJAueF/W4tWf4dJ0UguRiZBW8eq02C08A/cT7MW+D9
         eGgHkwjbJvIWh0CCr+535PLMgM29T6hMIu0DgrM00lewuoHFXmoRpR5BJgJSQnqxfRqS
         a2Qg==
X-Gm-Message-State: ALoCoQk1qFg79Lj96RRMhbUxKl/RdKQZfgHYwgECzeF+Me8wKCg1NeNjJzR1Tk152d1VCYRyznf8k90GecvZmjnY3/EJruDIyw==
X-Received: by 10.28.47.11 with SMTP id v11mr14009023wmv.27.1452511153889;
        Mon, 11 Jan 2016 03:19:13 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id i2sm29948097wjx.42.2016.01.11.03.19.11
        (version=TLSv1/SSLv3 cipher=OTHER);
        Mon, 11 Jan 2016 03:19:12 -0800 (PST)
Subject: Re: [PATCH v2 7/7] hw/arm/sysbus-fdt: remove qemu_fdt_setprop
 returned value check
To: David Gibson <david@gibson.dropbear.id.au>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
 <1452093205-30167-8-git-send-email-eric.auger@linaro.org>
 <20160111024554.GD22925@voom.redhat.com>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, alex.williamson@redhat.com,
 alex.bennee@linaro.org, thuth@redhat.com, crosthwaitepeter@gmail.com,
 patches@linaro.org, christoffer.dall@linaro.org, pbonzini@redhat.com,
 b.reynal@virtualopensystems.com, suravee.suthikulpanit@amd.com,
 thomas.lendacky@amd.com
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56938FA3.5070600@linaro.org>
Date: Mon, 11 Jan 2016 12:18:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160111024554.GD22925@voom.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: 8haqKcCKfeUt

Hi David,
On 01/11/2016 03:45 AM, David Gibson wrote:
> On Wed, Jan 06, 2016 at 03:13:25PM +0000, Eric Auger wrote:
>> qemu_fdt_setprop self-exists in case of error hence no need to check
>> the returned value.
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
> 
> This change is fine, but in general I'm disinclined to invest too much
> in the qemu interfaces for manipulating flattened trees.
> 
> I think our device tree manipulation in qemu is now complicated enough
> that we should move towards using an unflattened (i.e. pointer based)
> DT representation inside qemu, which is generally more suitable for
> complex manipulation.
OK. Is there any user-space library available for un-flattened tree
manipulation? I only found references to kernel unflattened tree
manipulations (drivers/of/fdt.c, include/linux/of.h) and dtc flattree.c.

Besides the indicated direction do I understand correctly that you do
not reject the series?

Best Regards

Eric
> 
> That would then get flattened into a blob for the guest in a single
> pass at reset time.
> 
