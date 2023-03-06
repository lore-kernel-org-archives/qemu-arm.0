Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4426500ejc;
        Mon, 6 Mar 2023 01:27:09 -0800 (PST)
X-Google-Smtp-Source: AK7set9BC/e6LryA0oWC6o6RWdh7hBcEdqrc+fecXEUUZfmLNEofp/JYOwkCiSfjs1aB2sJMZngD
X-Received: by 2002:ac8:5750:0:b0:3bc:e576:c177 with SMTP id 16-20020ac85750000000b003bce576c177mr15716276qtx.28.1678094828878;
        Mon, 06 Mar 2023 01:27:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678094828; cv=none;
        d=google.com; s=arc-20160816;
        b=zUfvj9Hi0/EkLwlItFM8Aud93l+vDUYaRMyZXLGS6oS54NgG+xcyViKT0iVFPvjtQK
         +JLGDvcFYqhiF1eITuRWy52GeBMMGxXUtsyxVvLH4rVqgzyIaFpoekvysTxBJmjgqoK6
         REzfKm5S+lzlQdzs/nu6LBZ5FtEV/xm8wYNoyjwysbymIHeympBn8MbchYVs9n64COIA
         2xAcN6iM2xaHL/qdP1ul/4FrgeU3jd3QzX32bKX+2fGXTQGpQQAJ0wloIw4ugHxrDl/r
         n41HweTV9Llnxm72YqMLs+ix4MV57W3MX8InHJUifKfM24H3XLY+JHPSZcy3kVMh3e01
         Uzog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=RVCxoISPsMUUVKX9jBhQfLyhrTTxfK/FPc4RIMTqVfU=;
        b=YjAfyF7B1PgMNI546/bhd71UzpZrGBRFHHtRAteP6zzC2ye+3vnqTm54X8AucN81Rf
         EF6PPQbO1fCtSowNnI5huvLj/cBJjoXG2ot8nJYoOpmboIa8tM1eGWGs/Mmd4icuJVnh
         PS/3cETot7kWhP7Ah+CnAwNn9to4l8A5fLEzTBAL1vsnDzOBkdxik4vzCWF3s+LnQHBj
         a3C7JKI2HXBfODOdbRQoaiTEFvmC1dwsg2hhhVMTqa3m0mPqVTO1w1KYvxcV230e4q8b
         Azc5BpAjng51FkX68mHzLhZ+wrh0HcXUx069cw4WuqqGQT/zk3dkajoGF11/8URgwesG
         FZhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y+f8n/eK";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id f18-20020ac87f12000000b003b9ea6c2a95si7359955qtk.559.2023.03.06.01.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 01:27:08 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y+f8n/eK";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678094828;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RVCxoISPsMUUVKX9jBhQfLyhrTTxfK/FPc4RIMTqVfU=;
	b=Y+f8n/eKuL9lWAviCeZTJPyQhtfqIuW54uiDcfNCC/IdaaZPjT9/UmEZLEdiihXk+xZI05
	52FZSThd8ZmZvAnfFCItH9kG0tTH266ijPg0kA7otKXHMHgRpPv1yq4JB3KhepXK43/8iz
	tG/jphKJyET3w6h492tsaRVsKhIz4oo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-tuDuK4RnONuyfVEmCP4RgA-1; Mon, 06 Mar 2023 04:27:07 -0500
X-MC-Unique: tuDuK4RnONuyfVEmCP4RgA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFFE1811E6E;
	Mon,  6 Mar 2023 09:27:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79A0140CF8F0;
	Mon,  6 Mar 2023 09:27:03 +0000 (UTC)
Date: Mon, 6 Mar 2023 09:27:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
Message-ID: <ZAWx5eBskd1cItDx@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230306084658.29709-3-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: lext43em7kz/

On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
> Aside from not supporting KVM on 32-bit hosts, the qemu-system-x86_64
> binary is a proper superset of the qemu-system-i386 binary. With the
> 32-bit host support being deprecated, it is now also possible to
> deprecate the qemu-system-i386 binary.
> 
> With regards to 32-bit KVM support in the x86 Linux kernel,
> the developers confirmed that they do not need a recent
> qemu-system-i386 binary here:
> 
>  https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 1ca9dc33d6..c4fcc6b33c 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -34,6 +34,20 @@ deprecating the build option and no longer defend it in CI. The
>  ``--enable-gcov`` build option remains for analysis test case
>  coverage.
>  
> +``qemu-system-i386`` binary (since 8.0)
> +'''''''''''''''''''''''''''''''''''''''
> +
> +The ``qemu-system-i386`` binary was mainly useful for running with KVM
> +on 32-bit x86 hosts, but most Linux distributions already removed their
> +support for 32-bit x86 kernels, so hardly anybody still needs this. The
> +``qemu-system-x86_64`` binary is a proper superset and can be used to
> +run 32-bit guests by selecting a 32-bit CPU model, including KVM support
> +on x86_64 hosts. Thus users are recommended to reconfigure their systems
> +to use the ``qemu-system-x86_64`` binary instead. If a 32-bit CPU guest
> +environment should be enforced, you can switch off the "long mode" CPU
> +flag, e.g. with ``-cpu max,lm=off``.

I had the idea to check this today and this is not quite sufficient,
because we have code that changes the family/model/stepping for
'max' which is target dependent:

#ifdef TARGET_X86_64
    object_property_set_int(OBJECT(cpu), "family", 15, &error_abort);
    object_property_set_int(OBJECT(cpu), "model", 107, &error_abort);
    object_property_set_int(OBJECT(cpu), "stepping", 1, &error_abort);
#else
    object_property_set_int(OBJECT(cpu), "family", 6, &error_abort);
    object_property_set_int(OBJECT(cpu), "model", 6, &error_abort);
    object_property_set_int(OBJECT(cpu), "stepping", 3, &error_abort);
#endif

The former is a 64-bit AMD model and the latter is a 32-bit model.

Seems LLVM was sensitive to this distinction to some extent:

   https://gitlab.com/qemu-project/qemu/-/issues/191


A further difference is that qemy-system-i686 does not appear to enable
the 'syscall' flag, but I've not figured out where that difference is
coming from in the code.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
