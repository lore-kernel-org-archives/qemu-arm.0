Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp607700njb;
        Tue, 13 May 2025 08:41:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUh67V6tzjWgcPBn7cf1MLv26FGmYYtTctPRzAm+cE63Y0zN0DJR20ZZoQ8OR8vFZ8HdLLb+BBcszX0WQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE/vziTA+KnxQGJgHAaFzsBVZAOq5C7c3yA2wmst04J1FIbxMqymaw2rJqbs5nkDO3Li3RP
X-Received: by 2002:a05:6214:4105:b0:6d8:80e8:d567 with SMTP id 6a1803df08f44-6f6e47c6b43mr291724936d6.18.1747150883449;
        Tue, 13 May 2025 08:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747150883; cv=none;
        d=google.com; s=arc-20240605;
        b=OrgYQb/iNlpEEAE+WstQdZG6I82VQ0TVlqcQtb2XJPenBhnixjtmxadA364U1JRwos
         rOXeLl5gKHi76i7WKxrF2yTonG8tN7dZrxlP0zTs9cbN1IFDeqCm7krbtEtgDBzyYY3F
         jKh2/I41ygIW6n4pFOaIuHXvfJ2ZpOKVE6vq7EinPx4rAmO/fGr4Oi3mo6zpqtnmSOOv
         SgqUc2JrcbGv6TZeppFDr3l9OkaAEOqEI3FO2XDxG1h7XJmU7leMdb+irfgDNd6NUT6w
         xoPG7FtJFrUPNorUEvKP5n8nryRB0mGgGCb1OWUsCjmveqjq7UqFVDoeeaIjm8X9YVcd
         ZV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=cmcBme9RJOCaIz52I3Nem99kp82JzzM+3hYCaD81L68=;
        fh=iM9GwfGv21/blqyxO272EqVSEyp03V2YmKTOh+3dT00=;
        b=H2kBZS+WfoWl4XNHbhlcxnY7451YaTfBho7HObYqJg9m/oyqBlVU0R5IGjPPYZa2vp
         2apFlQSzyPyL+A9h0mS3x1v49261qEsblg5x0IivJcmxNxoZun+VbqC3Ws6j8PH2/cD5
         IVYKiLVjpHapyIIoQ8T0yxNS8G5SCdOecNqwr6tegUu736yaRyRBOT37L61C+YylU3HC
         TjmOfVW3+cnJSiBe9Oacep7O1WrYXptSFnAmRU5huGhQYUtMGDsi/j34eIDdk42DwCVQ
         Ydcq9yFTctzfK7Dc2PYyI0q0deYR9SWGWKwA0HJLdpdIqvqF7OiP6p04P9VWSHgy33OR
         p4yQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=COiSMk5+;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39e7a53si121980986d6.78.2025.05.13.08.41.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:41:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=COiSMk5+;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747150883;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cmcBme9RJOCaIz52I3Nem99kp82JzzM+3hYCaD81L68=;
	b=COiSMk5+ShBdkIRrEoze0mdrYhwYtUboaDyEM5eVIeCt9GUt8NwYEk8NsqnIVAe7tT2vrm
	xQpBsERchmIIAZyLzzyqTUFjemMNPX6XGF97Sgg/ACmFL2RbngdlGQSDVl/pisx3YkHHcS
	sxA5ApOpXSBgkMh78HUfa4tAs5+Mjqc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-639-kY9XtUMzOoagtJuJDj4qRA-1; Tue,
 13 May 2025 11:41:21 -0400
X-MC-Unique: kY9XtUMzOoagtJuJDj4qRA-1
X-Mimecast-MFC-AGG-ID: kY9XtUMzOoagtJuJDj4qRA_1747150879
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB0531956086;
	Tue, 13 May 2025 15:41:18 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.110])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A681E1953B82;
	Tue, 13 May 2025 15:41:10 +0000 (UTC)
Date: Tue, 13 May 2025 16:41:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
	philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH for-10.1 v5 02/13] arm/cpu: Store aa64isar0/aa64zfr0 into
 the idregs arrays
Message-ID: <aCNoEs-jQ7IUTt8q@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250409144304.912325-1-cohuck@redhat.com>
 <20250409144304.912325-3-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409144304.912325-3-cohuck@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: 4jfrEsxeDOY7

On Wed, Apr 09, 2025 at 04:42:53PM +0200, Cornelia Huck wrote:
> From: Eric Auger <eric.auger@redhat.com>
> 
> Also add kvm add accessors for storing host features into idregs.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/arm/cpu-features.h | 57 ++++++++++++++++++++-------------------
>  target/arm/cpu-sysregs.h  |  4 +++
>  target/arm/cpu.c          | 10 +++----
>  target/arm/cpu.h          |  2 --
>  target/arm/cpu64.c        |  8 +++---
>  target/arm/helper.c       |  6 +++--
>  target/arm/hvf/hvf.c      |  3 ++-
>  target/arm/kvm.c          | 30 ++++++++++++++++++---
>  target/arm/tcg/cpu64.c    | 44 ++++++++++++++++++------------
>  9 files changed, 101 insertions(+), 63 deletions(-)

> diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
> index 7877a3b06a8e..e89a1105904c 100644
> --- a/target/arm/cpu-sysregs.h
> +++ b/target/arm/cpu-sysregs.h
> @@ -39,4 +39,8 @@ extern const uint32_t id_register_sysreg[NUM_ID_IDX];
>  
>  int get_sysreg_idx(ARMSysRegs sysreg);
>  
> +#ifdef CONFIG_KVM
> +uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg);
> +#endif

This breaks the build when KVM is disabled, and/or not available
on the build target architecture

In file included from ../target/arm/cpu.h:35,
                 from /var/home/berrange/src/virt/qemu/include/hw/arm/digic.h:21,
                 from ../hw/arm/digic_boards.c:31:
/var/home/berrange/src/virt/qemu/target/arm/cpu-sysregs.h:42:8: error: attempt to use poisoned ‘CONFIG_KVM’
   42 | #ifdef CONFIG_KVM
      |        ^
In file included from /var/home/berrange/src/virt/qemu/include/exec/poison.h:7,
                 from /var/home/berrange/src/virt/qemu/include/qemu/osdep.h:38,
                 from ../hw/arm/digic_boards.c:26:
./config-poison.h:185:20: note: poisoned here
  185 | #pragma GCC poison CONFIG_KVM
      |                    ^~~~~~~~~~
ninja: build stopped: subcommand failed.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
