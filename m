Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp172057ejc;
        Fri, 27 Oct 2023 05:54:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOVjVX6A+lpq3WBc/+ZxUkGGeuLNf9DIn2KKzfa8pssIIZFYaYQQECTxRhOm10rukowM/E
X-Received: by 2002:a05:622a:1113:b0:41e:1f5d:7009 with SMTP id e19-20020a05622a111300b0041e1f5d7009mr2713449qty.25.1698411251256;
        Fri, 27 Oct 2023 05:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698411251; cv=none;
        d=google.com; s=arc-20160816;
        b=pM1XO2l5B7dQuj9uwGyjn6QnJ2vDmFokoB2Qkzoq1/Me2qs1yD693AOuC0WdFtKAZK
         fw+rd6iX9jyOeZlL4F7iuiCAM21YCmlv8/iwQO04DvuEftghczdh5ZAEW+hheZXMqBe5
         8XL5C2Nw6S3/dgXJNkNinDdzHTMMEVGTxpTYSW0VszyWbmeWiid7/1yXjx0upHw/tO89
         stJW9PkibXedrk0mBYOttdgmc6AcbM2ytFmv1UsFfN4OFUAXIVRhIXTLXUhL4zWuWYPV
         EZ7mXwzz+AKg3u+fF8kjrKVXwrpcrUZYoDIhkC5vJjfdQbuRMaqK4pFAgLAg+Cg+qFuY
         pEMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :in-reply-to:mime-version:references:from:dkim-signature;
        bh=3I1XYbq/sNTvfydIMdXOLLOR5nGPnYyhmlipeJMWGPc=;
        fh=9kGGfukhMUqIdOwtAPvvZxy/E3GnszUOzIePD+v4psg=;
        b=ZCBuo6t41yXHpcjnMDSeGYHsR7JGiXPpKRd99j5gsPWBt8i/vmzZFi+497t/NLW7g/
         apNNjkVtllHtTTnhNH//84+VFAxA/KtTzcroDvsOWnDeJkPpic72FDMNodVi6zVpFPr2
         KAqd8NsyCES237xuy81NL4mjQK9KVDFkQG5n3uzODLyOOb7yNqx4YSh8HPqKmZDVob2j
         AaIU13Vsri8fV6aw7kfHBxf7IvbnuAogcz7Uo9QRXP6hmhMRMfVK/YBilWKQ5TlFHb+Q
         dxwf4WPrhbs2V2qg+l1Y+ye1OxsfOR78DaZFCoS8Y+4dcrjWjRqFY3ZDknyNycDJGkYD
         bxCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I1SFi3hd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14-20020ac87d4e000000b0041e3e49e944si676888qtb.174.2023.10.27.05.54.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 05:54:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I1SFi3hd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwMLN-0001kd-GM; Fri, 27 Oct 2023 08:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qwMLM-0001kR-AR
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 08:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qwML5-0001gU-UZ
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 08:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698411202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3I1XYbq/sNTvfydIMdXOLLOR5nGPnYyhmlipeJMWGPc=;
 b=I1SFi3hdRlkP7jBMSCwEVs0LRYPg/oTRpvTfdnaQ0GPIHjjy+DQ3YjpoAWw9vQnB3RIuRd
 Nywy/RypA3gmwr26B+OMMz1o7+4KKkWRJb0y57TcQ18ApB0/R61VZZ/AR4iMJnBp5P1qj3
 XcghlcF5GrlzkBB4jSmkAp9/v409/OQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-wgtnqzu9O-aKZ1nIMdzTmA-1; Fri, 27 Oct 2023 08:53:21 -0400
X-MC-Unique: wgtnqzu9O-aKZ1nIMdzTmA-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-41cb6df5c7bso25952141cf.3
 for <qemu-arm@nongnu.org>; Fri, 27 Oct 2023 05:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698411201; x=1699016001;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3I1XYbq/sNTvfydIMdXOLLOR5nGPnYyhmlipeJMWGPc=;
 b=ZtdFPO/sqivzUYSqRRyPVzsDxrO7pWQYpZo4gyW7OuS7YheGKZ3PCiiTZIhZesgClZ
 xriJ/Ko1jdX8kKGAcB1WWuQqS2lfyvjZyAuWBUVGo8E9onTFOmxXI7B/cTZkj4ZSt1gs
 CLgmnHJyrkVQhNVpHi0zJZhZqs2txtqM425mwRdgysNahZ2F/J7WLKmCpQLEbFtDOkSl
 UeJ3ZU73sk6UBRQNG5ygSJ2yztnUDEScgjrplIzOLnQt/HDixh6vd4lXPrO+NVYvCKym
 o/nI9CUvNeW/G/BxYTpLnOdEiUbExI+fCI+JUZfNUrlqtZWz5BMstaxKWedwHs5MepVL
 O+EA==
X-Gm-Message-State: AOJu0Yx4DyY8aG/hEZiTei4Kgbue7rZjSHGeFAY+pEfqY477GYzLOSla
 Wcb4Awxgpxnql997WGEsygK+AkbG3couFxYGBCG0eZ5XVGYYcl2FEtPTt3l1MBCOm3Ni95aWbIs
 ycWDEDgErqjvc1XD4sLcTsShMa21a
X-Received: by 2002:a05:622a:b:b0:412:24e6:a485 with SMTP id
 x11-20020a05622a000b00b0041224e6a485mr2956608qtw.2.1698411200598; 
 Fri, 27 Oct 2023 05:53:20 -0700 (PDT)
X-Received: by 2002:a05:622a:b:b0:412:24e6:a485 with SMTP id
 x11-20020a05622a000b00b0041224e6a485mr2956583qtw.2.1698411200297; Fri, 27 Oct
 2023 05:53:20 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Oct 2023 05:53:19 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
 <20231025190818.3278423-10-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231025190818.3278423-10-marcandre.lureau@redhat.com>
Date: Fri, 27 Oct 2023 05:53:19 -0700
Message-ID: <CABJz62N7-Bo8j=Dopt960=q8Q+CnDQRDWjMLFLqsLMOq_aZxHg@mail.gmail.com>
Subject: Re: [PATCH v6 09/23] ui/console: allow to override the default VC
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, 
 Eric Blake <eblake@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GjPEBQkEt1bi

On Wed, Oct 25, 2023 at 11:08:03PM +0400, marcandre.lureau@redhat.com wrote:
> If a display is backed by a specialized VC, allow to override the
> default "vc:80Cx24C". For that, set the dpy.type just before creating
> the default serial/parallel/monitor.
>
> As suggested by Paolo, if the display doesn't implement a VC (get_vc()
> returns NULL), use a fallback that will use a muxed console on stdio.
>
> This changes the behaviour of "qemu -display none", to create a muxed
> serial/monitor by default.

Have you verified that this doesn't break libvirt? We use '-display
none' for every single VM we run.

-- 
Andrea Bolognani / Red Hat / Virtualization

