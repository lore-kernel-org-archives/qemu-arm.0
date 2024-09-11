Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp76484nji;
        Wed, 11 Sep 2024 01:36:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVly2o/jWPsYZR2mMgBhCjf291d8MSUMCQ2AsL8CJo/Q5WugVhi95S9iZR4vgscZ3F19WUW2PaEdVoxJA==@linaro.org
X-Google-Smtp-Source: AGHT+IHYHo4et2BsJpIXUU1WjQV8YX1AHg9b+hVKa2lrDxyOMygjZoTgLbw+I1fGzSeGZJeITg+J
X-Received: by 2002:a05:620a:4628:b0:7a2:c2a:c9f8 with SMTP id af79cd13be357-7a9d3a166b1mr368508685a.1.1726043762118;
        Wed, 11 Sep 2024 01:36:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726043762; cv=none;
        d=google.com; s=arc-20240605;
        b=k2aTedd/tgdjDEM2ois9mHSqxL28T1K1GU4unaCz7HUYY9LVHzxB4E+CwXpzC1SxLJ
         qzLU07gGnuSUwsfKLcA6+bI17CehZQeJyYCE4Gp7hUWAEIPzkCuharV3hbhnm+KRymbS
         V71StNnELgJDmMEiYOLhSorf2ZoUcM77Ls2yzti1GVGoqA5aahArV1qnyL4pXZAMg+Hy
         e7P0tejJtcmKG9FLSSndjblCRRdex895lmRGsHFhPAWKDfKdUv2GDYXWrlEwsD3UNHOb
         w/eXhFh8T9Jw8oia1W1cYg4XDTDkil62j+XIYWraSfS/MeBDdYgNSM3VqhsYQEeCUa4u
         pelw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=/XNGw8Se064Ya4KciD5cw1pBjcoikCLo2yQ3fCVI8Z4=;
        fh=PRmnkhgnm8JqA1gAULy6PMbnznkOtF4flgaVCIvunxw=;
        b=TUE/sUMz2KcaDnemoIGVtiedNJ/OXJpt77i0rm6hXxGtOADQ8xdYVPeMQoqxqtb6Ra
         i1EBttwi38fRvHP4rkdNcYyfDzGpBuSNL0FQtd0EexZQ0ueYg+ej0CgNi6oj9fSxrxYj
         T9cTDERLd8ArkX3NvgV4J0B/+AfipPeyWwqRtfIeEzoCDlvn6O9ZI/HlR4Fyeblf4ZIb
         1hNVd118/vuyM3cnCHAahTGfsuSDG8QGCX/+1xheluIIBjfy6I6DWL2M5tObQPb0mx7h
         vywZhYNUNBcXKz39kGNV4EC/BTOtgj56e9LgVylUDR7mcSTv0y7tdbiPF203mzkeM8s/
         uMVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TMHwvAU8;
       spf=pass (google.com: domain of rjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=rjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <rjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a7a55edesi1014379585a.580.2024.09.11.01.36.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:36:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of rjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TMHwvAU8;
       spf=pass (google.com: domain of rjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=rjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726043761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/XNGw8Se064Ya4KciD5cw1pBjcoikCLo2yQ3fCVI8Z4=;
	b=TMHwvAU81gXaLHzFNGAFl0n7R9yLagHs34eH2hp7XFKbMq8/5MjK8ENVWYBob4tRzv7s4c
	ZYodBgL3rVkJfde7g72AW7fvh26QduNlw7uC9VE6L2XfssfHBEs50+zNHX7VvniMbb9Eh2
	TS4JtqDOa28WBO7ILyMYwHXaLuNu8Vs=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-490--aAmEBQ_PUqRpI0skSRBqw-1; Wed,
 11 Sep 2024 04:35:59 -0400
X-MC-Unique: -aAmEBQ_PUqRpI0skSRBqw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2A039195394E;
	Wed, 11 Sep 2024 08:35:51 +0000 (UTC)
Received: from localhost (unknown [10.42.28.10])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 88B4830001A1;
	Wed, 11 Sep 2024 08:35:47 +0000 (UTC)
Date: Wed, 11 Sep 2024 09:35:46 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
	Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
	WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
	Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Jesper Devantier <foss@defmacro.it>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>, kvm@vger.kernel.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>, Helge Deller <deller@gmx.de>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 25/39] block: remove break after g_assert_not_reached()
Message-ID: <20240911083546.GP1450@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-26-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910221606.1817478-26-pierrick.bouvier@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: zEOi+3Slrwvs

On Tue, Sep 10, 2024 at 03:15:52PM -0700, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  block/ssh.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/block/ssh.c b/block/ssh.c
> index 27d582e0e3d..871e1d47534 100644
> --- a/block/ssh.c
> +++ b/block/ssh.c
> @@ -474,7 +474,6 @@ static int check_host_key(BDRVSSHState *s, SshHostKeyCheck *hkc, Error **errp)
>                                         errp);
>          }
>          g_assert_not_reached();
> -        break;
>      case SSH_HOST_KEY_CHECK_MODE_KNOWN_HOSTS:
>          return check_host_key_knownhosts(s, errp);
>      default:
> -- 
> 2.39.2

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW
