Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2850280wrg;
        Wed, 5 Jun 2019 00:30:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyA4VWsJpiqbJ//ju6ixyl9EIWpk8KVUeN8wgM9WkNgJ7IRfLKmOIytLMPymlqQS5exV42Y
X-Received: by 2002:a0c:8b6f:: with SMTP id d47mr30805546qvc.32.1559719826649;
        Wed, 05 Jun 2019 00:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559719826; cv=none;
        d=google.com; s=arc-20160816;
        b=RDcp5s1I/dQa4Mp4b9aQX3fcQrMBPwQz1PyISTWOYkG9UpI0R+kb0E7dd3IJ4rnqHr
         W9H0tjNyHxjsyJLkDsl8Dk8ngH5d3Sb/TDKn5VUUVilkH0rB6YTs0CaOzQ/57WXUPZCY
         qea1jlM220xYnjiWM4OsgZvhEfdBHOdswdg8n0k1pm+BsUv5fqsId1ZHPGWe418cTiUJ
         tWadnvVr4JqrX51DsazcpC6iVZaWRWcmAGJzoxddx/3nlXccECWewepkzIv3Q/hhaBhD
         696g2FFj60urn3B+KsNDSSIDoQwqHZOE3HufHyHaT4OkksnDiqcf8OJaqGg/TkAaVuq2
         5Nyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=uJF8+7pu3WVBS/BevJ2M3QmfVdnpLyeDfjVMbYv/zWA=;
        b=vh2z8mcoElMPfC06n7ep+HxFbB7wDWh+sdg6IVbFO75+gwZVczGMQIRzU2Z6dTrVdn
         up7u790/BvRrF/fWgsiOBQfgjtwtiOs6QRPM8juzhiDf93wXMaf6aIldFIlzr0Bb7PLx
         zCZXpykzyZy4hYPY/xtK1YqiW5r3I3HxapT3JtTwKHuKFGrZj4bJR2q068VbFHfTkIx/
         fY9UKjsZ8nohmCja+nzjy1Ebty9H3jp0x0KEeYMzu7QCDRlkjlZjFFyPMewxzvZcwTXN
         KWFwH6ft8v2i3CMIhrZSds0NOUz2j4eUgLxUJarFiiTKNgo3RqV9zrBKuET0lIjbk2eZ
         muHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h185si4979991qkf.0.2019.06.05.00.30.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 00:30:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B071230860A4;
	Wed,  5 Jun 2019 07:30:20 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41BE460C61;
	Wed,  5 Jun 2019 07:30:14 +0000 (UTC)
Date: Wed, 5 Jun 2019 09:30:12 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	abologna@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH 02/13] update-linux-headers: Add
 sve_context.h to asm-arm64
Message-ID: <20190605073012.nh5wprpjqoi5e4v4@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-3-drjones@redhat.com>
 <c2756de5-be71-45f8-8ca4-bf9f594d525d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2756de5-be71-45f8-8ca4-bf9f594d525d@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Wed, 05 Jun 2019 07:30:25 +0000 (UTC)
X-TUID: aj0TDLwO8Vpk

On Wed, Jun 05, 2019 at 09:21:18AM +0200, Auger Eric wrote:
> Hi,
> 
> On 5/12/19 10:36 AM, Andrew Jones wrote:
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  scripts/update-linux-headers.sh | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
> > index c3819d2b983d..e1fce54f8aa3 100755
> > --- a/scripts/update-linux-headers.sh
> > +++ b/scripts/update-linux-headers.sh
> > @@ -99,6 +99,9 @@ for arch in $ARCHLIST; do
> >          cp "$tmpdir/include/asm/$header" "$output/linux-headers/asm-$arch"
> >      done
> >  
> > +    if [ $arch = arm64 ]; then
> > +        cp "$tmpdir/include/asm/sve_context.h" "$output/linux-headers/asm-arm64/"
> > +    fi
> >      if [ $arch = mips ]; then
> >          cp "$tmpdir/include/asm/sgidefs.h" "$output/linux-headers/asm-mips/"
> >          cp "$tmpdir/include/asm/unistd_o32.h" "$output/linux-headers/asm-mips/"
> > 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>

Thanks, but I noticed we don't need this anymore. Not since b1b9e0dc78a8e
applied an identical patch. I've dropped this from the v2 I'm working on
now.

Thanks,
drew
