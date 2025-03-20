Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1032024njc;
        Thu, 20 Mar 2025 08:29:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjeI7TSpX94FIGNO/7VmeBBJ+p99xhC5Yg3nSL8rjjRSL/G5QXiwbVwre7rUB8yaIc+RRhpIkA/UY2Wg==@linaro.org
X-Google-Smtp-Source: AGHT+IFqbED+AtNn3EgTcwU1Styzzscsriz03EsShzR64W4CnVjp1SnY5rn1OyJfJnqFejsB3Sxl
X-Received: by 2002:a05:620a:4555:b0:7c5:a444:c8d0 with SMTP id af79cd13be357-7c5b0d07af1mr542350585a.40.1742484589267;
        Thu, 20 Mar 2025 08:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742484589; cv=none;
        d=google.com; s=arc-20240605;
        b=XcFM+gs7iMVzc/rwK88mXzxuCu1NGr+4i3v1DTrwst3ZWw+fA0cyvjfv8JxXL7TVnF
         +vD6rk+zruQuwHSXdVIjONJCT6tH01y+kMr8QDwD1/HQCYnnRwI6VXEGB3C8v3dtX6i+
         0B6dzubY491OngcNJEtvcbTGCkLggzLAa+HFSp3Ixgv0/8dwc5LptJyj4FQQtw8oS8q7
         4oXqlHCMLM5+jNJzzlH26JAeBc7FOEL1mLMqfwlqDiFd0MqXnYooOPwD3nCrUyRfKC8t
         vAMMSd0zuO69qNRAmeeza+IfF7kdNt1EMEOgIK53cVea173yRKBErBBAMhIjTJiIrFVW
         dsCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=FHzTTbYYErG3BHAoth3Rm1XEBwqah4VOUhcwHJtuowg=;
        fh=aw3vufCtvLIAVAc91anQEo72BG8w4aL4IHtUyfmq8KA=;
        b=VE+7J6s5J8XkbGmCVYawpHHIadXYuT3yTW0ChEENbmjnDg8g9oXCYFaTQnPkl4VI01
         EQ7GOHX2uCQ6jOB1RSt8wv8YVk+kQ69AwkPjWXm7o2N4gT0gW7ka58m2XXozJ90xTEfY
         TiBCcOUaxC9Cws+Raa5Gpmm9AvkTsQAS6h+MiWWx604rgRecsPIeLG0t0lpC7jUSz/c9
         4DTcWuGPNeBccM/AC3ed6XvdWlqrXe3V5+bgQZWeGsOs/2YypCFBGRBB+bbSssBMRUV6
         TeYRC059aenrazePpcGpDg7lbKr/Mk8+Q531iWPNs7JKVzwC//TQX24yri41tg/tZkvU
         pFgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FPk5uM24;
       spf=pass (google.com: domain of sebott@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=sebott@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <sebott@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b92d024csi7051385a.174.2025.03.20.08.29.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:29:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of sebott@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FPk5uM24;
       spf=pass (google.com: domain of sebott@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=sebott@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742484588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FHzTTbYYErG3BHAoth3Rm1XEBwqah4VOUhcwHJtuowg=;
	b=FPk5uM247+LqhoLJGApf86RsqJCL58CPd0xXIvqTBu0XX+28Ju/m8GTiE6pByAbaKj7Jis
	dyWZa2yzVipa5XK1RqrxxIxIDKD5KFbG5/Y4RK7oluqTao+WiPCd2Jugg1fxBtEyMxWbDC
	wQgYp6RmCpFWaYY6LcY5Bx9FmCDYohY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-PSvuBAuBOoyooqVS2HYoug-1; Thu, 20 Mar 2025 11:29:45 -0400
X-MC-Unique: PSvuBAuBOoyooqVS2HYoug-1
X-Mimecast-MFC-AGG-ID: PSvuBAuBOoyooqVS2HYoug_1742484585
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39126c3469fso410218f8f.3
        for <alex.bennee@linaro.org>; Thu, 20 Mar 2025 08:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484584; x=1743089384;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FHzTTbYYErG3BHAoth3Rm1XEBwqah4VOUhcwHJtuowg=;
        b=c4D9LxK7einS9Pp7gPtfyiKyaus6mzz+gnoQEgiXqZ8i7kbF01WmAbC1EEVfAB61oB
         xyA6rKfgUpG11jVA5m5J5yF2lPzA9jvDpVS9pc3BZGnrU4DGLfL/2GoNQNY1901clOvz
         cbH8OavSMfeOCvWBqJo0+C6XxFs9LSz7XMh4LOfjbOB29IUSO1VaXN8IqKKJvq7cYXNX
         2fptkQsokhM3Gh+99swEDCAAzLlzbg++ucnmW5bvwIcDb8Kv3mcbrstA6dQ/RThMFZeP
         aHX8y+zOUS1TEBW8pu9fVaLUDZE/v9PEK6GwCN+HNbCpADAz6xelGYL7qev72MUhuBiK
         yjPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFMCkW5ZJvpUHPQHVCQqCpQ+LyqDAkV6kbslVIuEaS0Co6YWiDIEYRE3RS+NmpowKlnUL28wcqRx1C7w==@linaro.org
X-Gm-Message-State: AOJu0YyfJW/GveuZf+uk7chELAwlCeS+IXEv6f8ymgmWZnMDC1e4CjZt
	wb/7ylwtPSZQC1bBqijZWesggU9u3C6X9JAsGqpDKQ3uJ27AgHKGarwVRBCfjUMUWOUwNBKtguF
	1dldUkm1mfx47mME3XHn/mIonQ24vBnIGjZB3IS203KSgYW3QzyupWA==
X-Gm-Gg: ASbGncsVp2iJKe3Ililsu0XAd1pCavmvcB5Pa2z0MSntFgQ6Dx2EscXIxskoSWEVj+s
	gj5GDNRRFtULPq7/mJFhCP5taTUeJNukSmXHiahs+LCOo+b1YOlw94G/CYs9/fZNXUGlz5Z8yoK
	47stml1S/xBK1cboQSyXBtFbj7jKRoMHvc0EvyMI6RSB/SkWSv7LW2uewBWIf/pGGxasI9uMCza
	X1n6/2BaXiuwFHjC+d8gD3uqKi8CWfF9OsBM93ghgPvBiav5pPWHEpRYQpmGf7FiIQvJoRgfkpM
	bcZFbRwXwdk7iRVCg1B9B1G4WHkTkVFQZVOuj75bxZfFEbeJ0PLllBUSel1UfOyj
X-Received: by 2002:a05:6000:1564:b0:390:e535:8770 with SMTP id ffacd0b85a97d-399739bca2emr8416860f8f.14.1742484584434;
        Thu, 20 Mar 2025 08:29:44 -0700 (PDT)
X-Received: by 2002:a05:6000:1564:b0:390:e535:8770 with SMTP id ffacd0b85a97d-399739bca2emr8416824f8f.14.1742484583976;
        Thu, 20 Mar 2025 08:29:43 -0700 (PDT)
Return-Path: <sebott@redhat.com>
Received: from rh (p200300f6af11ec00f9928575aec32536.dip0.t-ipconnect.de. [2003:f6:af11:ec00:f992:8575:aec3:2536])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d3adc4488sm54468955e9.0.2025.03.20.08.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:29:43 -0700 (PDT)
Date: Thu, 20 Mar 2025 16:29:41 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, 
    qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org, 
    richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
    oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com, 
    armbru@redhat.com, berrange@redhat.com, abologna@redhat.com, 
    jdenemar@redhat.com, agraf@csgraf.de, shahuang@redhat.com, 
    mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 13/14] arm/cpu: Add sysreg generation scripts
In-Reply-To: <20250311162824.199721-14-cohuck@redhat.com>
Message-ID: <17649857-752b-a149-3935-5bcbd5c50627@redhat.com>
References: <20250311162824.199721-1-cohuck@redhat.com> <20250311162824.199721-14-cohuck@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XsieDLiv3iaRymPMUIsh7MRnvm8tkgiHJHnpWlCCYjU_1742484585
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-TUID: IkImJ5Vbx2tD

On Tue, 11 Mar 2025, Cornelia Huck wrote:
> +++ b/scripts/gen-cpu-sysregs-header.awk
[...]
> +BEGIN {
> +    print ""
> +} END {
> +    print ""
> +}
> +
> +# skip blank lines and comment lines
> +/^$/ { next }
> +/^[\t ]*#/ { next }
> +
> +/^Sysreg\t/ || /^Sysreg /{
> +
> +	reg = $2
> +	op0 = $3
> +	op1 = $4
> +	crn = $5
> +	crm = $6
> +	op2 = $7
> +
> +	if (op0 == 3 && (op1>=0 && op1<=3) && crn==0 && (crm>=0 && crm<=7) && (op2>=0 && op2<=7)) {
> +	    idreg = 1
> +        } else {
> +	    idreg = 0
> +	}

This doesn't seem to be used. I guess this is in preparation for later
usage, when this can do more than just the plain register definition?

Sebastian
