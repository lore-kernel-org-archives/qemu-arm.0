Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp10287774lfk;
        Wed, 24 Nov 2021 03:08:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPi7YPkQqi4klMVCIdgGewJLTlmoZq3s/QteDXzHeIwrgyBSPwgqaTuKK4Wkk6uOUFnqg6
X-Received: by 2002:ae9:ef11:: with SMTP id d17mr4544542qkg.347.1637752110253;
        Wed, 24 Nov 2021 03:08:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637752110; cv=none;
        d=google.com; s=arc-20160816;
        b=X66/MJ3veZDcBjTcBHoeogco5NfoUUSahGx9ngciDuAiYeXD4bbjMVdXnZhIT6p7wp
         Qus95/oxcXAODYj3/Xha33uAmrDwjtc4cvExKel8SA1knkeZ+EM9uJ5xtg1a8YMnH/bT
         vI3h1aqHUSf8v99vuI0u0c8ZWs6w5KX3Z5Q04QqSqL0u/MvZgDfe/iN9SiE7OTON4vdE
         2yHmZGB5tjqT5XT8iOALod5EEjMA5U651fyBOEpTQG/ZynXEWnB0mNSx43dyhPznwwLQ
         0lGvnnehHrzepqFd8wwHwpS7aYOvTIhniuYksp4l/RXjcDq3LeXzSrkjsi1ERIvKPuCL
         jP/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=waH4hRzlVOpWIl+cTH6RBonEIb6tUAeusmu8efKZ6yQ=;
        b=AVnd2rqF/dAqwm3GC+Pef8rGtOeJzCoW+4Ml/6mzoOv7wzHRgo2wvc3VBhfeQMCEqr
         9hwW6npyEspuKU8dRwaTuLPbjdR98P3EdpT0VdvX6ecBzGUPWYcbsnVLUBjqsFZwGekD
         suMVWvFQpCUOnDiZ6Qe1GxShsQQ/UnRP38+BqJJ9R1QC0L1TjYnjjANvF0eps8RfE193
         nlviEV1aCPJKlWAMgHTtVZsSxXdrHVDgPxinqPzXJGjy/QN96s4+T24d2hBaP9nMt2eR
         s2ABEVOTEadWTQiJttJvFY4As3WMTpwlIH9m/vLaX5l5abljC6TiHsWZd2aCDTx4j98p
         /fXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SBZqbIld;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id t15si15708765vsj.187.2021.11.24.03.08.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Nov 2021 03:08:30 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SBZqbIld;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637752109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=waH4hRzlVOpWIl+cTH6RBonEIb6tUAeusmu8efKZ6yQ=;
	b=SBZqbIldEPHVtDsI9lCCNDNdKzZbLHHmqQkaG0Oel8izYYW6xp8gqICSD6cS+mx5XTdyjw
	woiffO49uzzb13NZwzIsR6v+P93D2XAWFFCUDB0lxsyQs0D+SICG/KHPsmh62RroSLNP9G
	SKJl4o0xQ94Xd1ZOHHvfJKIS/u06HEc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-00lg8k13PBycdq7STGNSxw-1; Wed, 24 Nov 2021 06:08:28 -0500
X-MC-Unique: 00lg8k13PBycdq7STGNSxw-1
Received: by mail-ed1-f70.google.com with SMTP id n11-20020aa7c68b000000b003e7d68e9874so1995117edq.8
        for <alex.bennee@linaro.org>; Wed, 24 Nov 2021 03:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=waH4hRzlVOpWIl+cTH6RBonEIb6tUAeusmu8efKZ6yQ=;
        b=5HV8DT/gCIiDPiN3FBN2OnwOeJNugZZcxe+H+FAs4mrrqgIeaG/J6ldAmr5FLN9qCb
         hUi9O++BtEYJ1z7BfjVBEjwRmBrsGSaow2ujgUN0AperH240eHH+GuDg/NpIRbcohZ+F
         /JAfjWIFTSg/s9rZZUhNTfHVqwL1ULBD55T4VfLTqONguohuiHAKmI6J/sdycN4M4duW
         0bh/DPm+E0/64FDkeu3K9tbUlVgrpcej7eGg9mjHoQNRnwKPGcnlo+xg/OiBUoEASzi2
         YdQZT7Ye0tHFhceTAgSEYPkwIa9O4a/uOvLg6QgHJ0l884ienRu+Co6zvT15oB36L3oa
         X+dw==
X-Gm-Message-State: AOAM532UY7jPP9KGnrUm05tF/+mzlm2ed9hd41Rw/TupR3Oii6/ySbZN
	CHgD++lU6ooiyqx5IkinMk2/JcftBYZdWePf1TrF+w8Rgc0xh4WvansoUXJkZ/Fnddt/iS+C9R+
	Bn7d9rXrGR6WanYvZT8ec33Pl7k97fzacPcCSTYmvppeSnMq6xxPPPHV3OTIhAfxaoCQ=
X-Received: by 2002:a05:6402:50d4:: with SMTP id h20mr23601540edb.52.1637752107159;
        Wed, 24 Nov 2021 03:08:27 -0800 (PST)
X-Received: by 2002:a05:6402:50d4:: with SMTP id h20mr23601480edb.52.1637752106917;
        Wed, 24 Nov 2021 03:08:26 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from gator.home (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
        by smtp.gmail.com with ESMTPSA id nd22sm6940051ejc.98.2021.11.24.03.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 03:08:26 -0800 (PST)
Date: Wed, 24 Nov 2021 12:08:24 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvm@vger.kernel.org, maz@kernel.org, qemu-arm@nongnu.org,
	idan.horowitz@gmail.com, kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com,
	thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH v8 01/10] docs: mention checkpatch in the
 README
Message-ID: <20211124110824.yqrtjkbul3h3pv2i@gator.home>
References: <20211118184650.661575-1-alex.bennee@linaro.org>
 <20211118184650.661575-2-alex.bennee@linaro.org>
 <20211124110659.jhjuuzez6ij5v7g7@gator.home>
MIME-Version: 1.0
In-Reply-To: <20211124110659.jhjuuzez6ij5v7g7@gator.home>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: S3MW+xflwRG4

On Wed, Nov 24, 2021 at 12:07:02PM +0100, Andrew Jones wrote:
> On Thu, Nov 18, 2021 at 06:46:41PM +0000, Alex Bennée wrote:
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > ---
> >  README.md | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/README.md b/README.md
> > index b498aaf..5db48e5 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -182,3 +182,5 @@ the code files.  We also start with common code and finish with unit test
> >  code. git-diff's orderFile feature allows us to specify the order in a
> >  file.  The orderFile we use is `scripts/git.difforder`; adding the config
> >  with `git config diff.orderFile scripts/git.difforder` enables it.
> > +
> > +Please run the kernel's ./scripts/checkpatch.pl on new patches
> 
> This is a bit of a problem for kvm-unit-tests code which still has a mix
> of styles since it was originally written with a strange tab and space
> mixed style. If somebody is patching one of those files we've usually
> tried to maintain the original style rather than reformat the whole
> thing (in hindsight maybe we should have just reformatted). We're also
> more flexible with line length than Linux, although Linux now only warns
> for anything over 80 as long as it's under 100, which is probably good
> enough for us too. Anyway, let's see what Paolo and Thomas say. Personally
> I wouldn't mind adding this line to the documentation, so I'll ack it.
> Anyway, we can also ignore our own advise when it suits us :-)
> 
> Acked-by: Andrew Jones <drjones@redhat.com>
>

Forgot to CC Thomas and Paolo, am now.

Thanks,
drew
