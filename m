Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1066279njf;
        Thu, 15 Aug 2024 19:32:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUzo2bhFUNSSTKZqvrVbSPu+1NpgXV3cCFlkWmpDj1RC8y+iGp9rSZ9pMcseCmRS4D6QyJxNdIVpSj21toJnSC5ZF9A1vt3
X-Google-Smtp-Source: AGHT+IGMsVjQKWQgGjYSMfANaFMkpec0PrCEwahypgSUyjjSNx3hVO1rb0AsJE5borbSmMH9tm4k
X-Received: by 2002:a05:622a:5a1a:b0:451:d57c:31e3 with SMTP id d75a77b69052e-45374253265mr18799031cf.29.1723775524428;
        Thu, 15 Aug 2024 19:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723775524; cv=none;
        d=google.com; s=arc-20160816;
        b=JnHdOuhLmtnUEuQGqVhIsNbmXOhU5DrEyQcFDNLJaXCVJwjYzGEUIThJVcUWtI3X2Y
         tikB04Q7DH06vfaEjASo0f+od6OLKJGvp5mg0uAD4hVSU/YUqr5DOo6Rxek3Eco2uwsg
         ap0zu5XLCycZGdYszvLlOZ/Dt9M+6SLeDoaZNcrnlba6iibAtHLq7SPMPWAXq4hqKpo+
         MmGjrYJ7dH/uDI7+dyhQfE9+EifPeqzSyXPOGyQ75UCGs+C7/+cmPjzLTZ+GffvosaSJ
         QALCkhoeFrvW9zQT0QalptkcpefTs4m/oyaj3MqGbHNrBbRP5B4+gs5CmgFMqNIKD7KF
         X7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=grOFC+auwbhT88GAd3WGdq0vMd4igSM6zH1Gih7uRac=;
        fh=qiILke2bOpWpVj2BwHpNARlR7sMWo/Sc4Z5jYiyQrZc=;
        b=CB5mRAi2NSN1+MyBenVUapGEMFIUYJ6CeilcLZhskcJNpTAEV+5xjvHQaf1Amr4/jU
         /OcUOUcku//MHqc77f2CQO+MWwMyVmvL6bsAvNcIJelK+0KG3Lm3V82/4ylKh11d4f4r
         hF2KjV3DtB9Z4I4vwuXF6CKww/LdFqPuZs/8T5teqyrf6tsT3+1XtgmrSAHiJ/wVe37v
         D15dgWNNNPtRmDGYdQlj3qoj2NRgI5DEPJX2isPoFAlGoedYtBs8Ao/YbvdiUXyZ7cft
         9sbHWmXEpXG6hR+BDoAmpAsehPRMp48Dd1fYCgnhgJazZ+2/la83OvgYiQxSP1VQFYCQ
         DkXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OevDuqYv;
       spf=pass (google.com: domain of jasowang@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jasowang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jasowang@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4536a0716c1si31072281cf.297.2024.08.15.19.32.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 19:32:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jasowang@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OevDuqYv;
       spf=pass (google.com: domain of jasowang@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jasowang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723775523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=grOFC+auwbhT88GAd3WGdq0vMd4igSM6zH1Gih7uRac=;
	b=OevDuqYvoKMYdxMIkIlQi/avz4V0vrKRsnebQgpjUzPmgfls2XoVBVW7bQo/NL+ymLOj6x
	4xWIJcwJdW5f9VHMnFPkf8D7TqAUA2LUYaHJnA1Nl3jxYmCd4oLj1IBtZYyMo6ks7Sf0SO
	qGFwGCKdxX003BHS/TL0dbqFj55Lbmw=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-YXWGQh6qOx6gUiTHEEj8_g-1; Thu, 15 Aug 2024 22:31:59 -0400
X-MC-Unique: YXWGQh6qOx6gUiTHEEj8_g-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-71065f49abeso1424271b3a.3
        for <alex.bennee@linaro.org>; Thu, 15 Aug 2024 19:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723775517; x=1724380317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grOFC+auwbhT88GAd3WGdq0vMd4igSM6zH1Gih7uRac=;
        b=NxUgtdrzq+1MjXBzFuEagRsLicYNmtwtkD77+CNrGu25XrpoqgPBPTDoSky7IZs5i2
         lJ+edOTbXyVJRZ247baB1ROJxOun+G2Tp9USREyuoMtJMgG7cIjjgFUPk5jBYgy8ZiAz
         Ix9DwVMdy45lATPtikRCX90ulicP+N6ohhmDkcBDgU5RdaV7v06z+bLynkjq7AmU/322
         ayBNoXgSqaUBLOE1hRt2jkIR/7ItrHvfc1usgMNA8nMEC/VvROF9aNk0gc3Y9p+kfrz1
         E7q1hv0Z3+/2h+Lv3Uj/ocePtUBrGTs83E5i9nNRhOLhJu6LyptsoOMdpAbUO0r2XLjW
         i2jg==
X-Forwarded-Encrypted: i=1; AJvYcCXOwPlZrhFlUq/5whQ1K0CVkZr094a8fhxolOHfMTw3ZmABxpMMWsYr6g9vJ1GKIQd0OkNkoY8J2U7nlvawQsgtJFIqDbEW
X-Gm-Message-State: AOJu0YwzDUTHM0j661/Wkq2Qh1YnoC3wO7sCULX00uVfCyZ/NugSsAR5
	tomUWk9UeCfhN+VH+ddo3jCx+x4Ncug1AaQSWMRQaSV3Pu7tjErj10PPzoSOS47U5jKlRCyiHbl
	iHT43waykxN8+9rAe4vDSz1P9ZXi7KbXGncVa1FNxTnDcDuHILOY4gmDaeA2oiz+gLT8JzVR8lE
	FgKmNqpxWsSErAunF6OiWc/bZAaT8R
X-Received: by 2002:a05:6a20:d502:b0:1c4:919f:3677 with SMTP id adf61e73a8af0-1c90501f4a4mr1993060637.42.1723775517675;
        Thu, 15 Aug 2024 19:31:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:d502:b0:1c4:919f:3677 with SMTP id
 adf61e73a8af0-1c90501f4a4mr1993001637.42.1723775516991; Thu, 15 Aug 2024
 19:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
 <20240813202329.1237572-17-alex.bennee@linaro.org> <20240813164631-mutt-send-email-mst@kernel.org>
 <D3FEPPLH78YW.3BYA9B4HYGN1U@gmail.com> <20240814030308-mutt-send-email-mst@kernel.org>
 <87y14z81ak.fsf@draig.linaro.org> <D3GARIYVC16C.20SXVKSIMLED4@gmail.com> <20240815102754-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240815102754-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 16 Aug 2024 10:31:41 +0800
Message-ID: <CACGkMEtS6kges+_hOum2QnpTWotT_ohkJv8PaFHsycjR10QY5w@mail.gmail.com>
Subject: Re: [PATCH v2 16/21] virtio-net: Use replay_schedule_bh_event for bhs
 that affect machine state
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
	Michael Roth <michael.roth@amd.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Weiwei Li <liwei1518@gmail.com>, 
	Eduardo Habkost <eduardo@habkost.net>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Eric Auger <eric.auger@redhat.com>, 
	Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org, Peter Xu <peterx@redhat.com>, 
	Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
	qemu-s390x@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, John Snow <jsnow@redhat.com>, 
	Alexandre Iooss <erdnaxe@crans.org>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5ie8zaZ7TdyA

On Thu, Aug 15, 2024 at 10:29=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Thu, Aug 15, 2024 at 05:12:32PM +1000, Nicholas Piggin wrote:
> > Could be a good idea. Although I'm not sure what to do with
> > all types, maybe we can restrict what is supported.
> >
> > > Is this wider re-factoring something that can wait for the next
> > > developer cycle?
> >
> > I would say so. It's not quite trivial to do nicely since
> > things are a bit tangled between util/async and replay.
> >
> > > >> I had started on a conversion once but not completed it.
> > > >> I could resurrect if there is agreement on the API?
> > >
> > > I would certainly welcome it being cleaned up. The supported replay
> > > devices are very piecemeal at the moment.
> >
> > I'll tidy up and post an RFC for how the new API might look.
> >
> > Thanks,
> > Nick
>
> Fundamentally it's virtio net, up to Jason.

It seems it has been in the pull request from Alex Benn=C3=A9e.

> I don't like messy
> APIs and people tend to get distracted and not fix them up
> if one does not make this a blocker.

+1

>
> --
> MST

Thanks

>
