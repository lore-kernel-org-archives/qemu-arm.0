Received: by 10.182.105.169 with SMTP id gn9csp1107222obb;
        Fri, 6 Nov 2015 06:46:04 -0800 (PST)
X-Received: by 10.68.108.66 with SMTP id hi2mr18322322pbb.131.1446821164471;
        Fri, 06 Nov 2015 06:46:04 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x233.google.com (mail-pa0-x233.google.com. [2607:f8b0:400e:c03::233])
        by mx.google.com with ESMTPS id qw9si576271pbb.172.2015.11.06.06.46.04
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 06:46:04 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::233 as permitted sender) client-ip=2607:f8b0:400e:c03::233;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::233 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by pasz6 with SMTP id z6so129069583pas.2;
        Fri, 06 Nov 2015 06:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=a1Bb66UXK0mkUKJhHqeYEnL8vvh6UkNO/+itB71SkME=;
        b=pj6lCqsrIjN8PTS746Lv3DhaxE/qvyuJtlqVLBYdynL8Byg6eGm0K4SLRe5/td8xKO
         lS71g1HjIJPIn4RRui0awHaEk6IJYP8WvrdttI57h51q4c/D9USI80DlNS5k2oAL0yW8
         V3V+F8JJQAEGvhkaAOdqtr1UxWn+KobSOTafithoq8hMsCCiiX4Tf/SGi6dxaImngMIs
         FKsDtZmFYMRFqYD6CKSn4iOhtp1Ca8/rTlC6A1j/t/XEbUoJB3oypOLsY/FKhdAemp7G
         oorhKe9s+CrexODReMivg17bws5CuYKBcB+CfP3bNFELBXL//J5YQijhG4hQMGkjN4kJ
         DLfQ==
X-Received: by 10.66.192.164 with SMTP id hh4mr17902538pac.150.1446821164058;
        Fri, 06 Nov 2015 06:46:04 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id yp5sm500643pac.38.2015.11.06.06.46.02
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 06:46:02 -0800 (PST)
Date: Fri, 6 Nov 2015 15:45:59 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 14/16] hw/arm/virt: Wire up memory region to CPUs
 explicitly
Message-ID: <20151106144559.GQ13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-15-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446747358-18214-15-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: ydgbSHo2EmMM

On Thu, Nov 05, 2015 at 06:15:56PM +0000, Peter Maydell wrote:
> Wire up the system memory region to the CPUs explicitly
> by setting the QOM property. This doesn't change anything
> over letting it default, but will be needed for adding
> a secure memory region later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

I'm not sure I understand this, if not set, wouldn't "memory"
just default to sysmem anyway regardless of if we set
"secure-memory" or not? I'm probably missing something
in the init/setup sequence...

Anyway, I don't mind explicitely setting "memory":
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  hw/arm/virt.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 77d9267..3ab31e0 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1020,6 +1020,9 @@ static void machvirt_init(MachineState *machine)
>                                      "reset-cbar", &error_abort);
>          }
>  
> +        object_property_set_link(cpuobj, OBJECT(sysmem), "memory",
> +                                 &error_abort);
> +
>          object_property_set_bool(cpuobj, true, "realized", NULL);
>      }
>      g_strfreev(cpustr);
> -- 
> 1.9.1
> 
