Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2667270ejb;
        Wed, 4 Oct 2023 06:50:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhjFI3soj5FXfFwXBTeghJGbsYarQmdL1RuG696y8cqdtKQ3/3Plz/jIpd2NE8Sucx0GeC
X-Received: by 2002:a05:622a:142:b0:417:bdd5:fd17 with SMTP id v2-20020a05622a014200b00417bdd5fd17mr2628024qtw.31.1696427437583;
        Wed, 04 Oct 2023 06:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696427437; cv=none;
        d=google.com; s=arc-20160816;
        b=rb6Mnvwi17611AODrpoh71ZBoaln5K6JNAjyaVfA84wc8hLKzzwcqo1wu726W3GhTh
         O3VJ4Kh+WE8mNh5upIkXodRAP/qNdwkxxlXe1wxSgjvvfDXonKGr7Kbw6eIAxOKjb7z6
         XqaTXY8hRixgxz/cdO1ptCja8XnHfAoqRmAT42s+KQT4tEOaLT7BqQEl01bzQa1WHxpo
         LH9p6eUD+lfYx7UaHpYxKqeLa0kkSIYpxxvRO+MX/DFO0t79nFzd2XGhS4AKgzA7VXp4
         eSuLZHGvp70pNAcyfW5KsA/bNORrooP4WFzkrNEUbLH5u/Ga2mGmFea/p4hgWxEwk96L
         /WfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=04v1Y2ap8PgeFJZuk9aFB8ktqtsNW3EnF+uSxtf2btw=;
        fh=eihArfmJhUL6EqE+ZkzYoBc7YbCqnJ81Jqxw07E0GHk=;
        b=cIT3OD/eJ4+pDK+KM9g/65TSfhDXqJrOuPTe4ARft9+sAG5kR0J9Bg526Miqa7Kfja
         aqqOQYh8xEpIWrmHyUKcOnUcs/+nTCIYCU7y+ki7lEOBlZP0A99WOlvYbzwAEiYth4hz
         PKx3WRc3Fjhw7RAdiK0UbzWb9ZiTizIWZDOjaae3x37bLBnd1Hjjkwr2mQfAWDfw1kiS
         gecnPYvPCDZ0z2Fsbf/KgPVw8fcjQIG8IKZOQuuhiMnAvffskF5D9SxML5KVxVsq1jvj
         ppXNfGMg18tsWPlJCK/RHqP3kT+Xo9thpt3oFFD5lwK1EYePRfQGaizJWEg+85gysr5G
         Eu+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fxHGdx3S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cf15-20020a05622a400f00b00419af4fa901si1483708qtb.208.2023.10.04.06.50.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 06:50:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fxHGdx3S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo2GK-0006UU-0J; Wed, 04 Oct 2023 09:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qo2GA-0006Ok-EM
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 09:49:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qo2G4-0000Op-Ms
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 09:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696427386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04v1Y2ap8PgeFJZuk9aFB8ktqtsNW3EnF+uSxtf2btw=;
 b=fxHGdx3Spz1frxNmQMo51sx/XO7BWYTKelu2jMieZgkvbwSf7GhZetv9DeI8HTw+36bZVn
 Yrh/JUxvylk/3QaimZSI0m0gR0924Va4NqAyXW0cXncgzVq+YxIJ2VNK/ejRgZsm5bYfsm
 94G1Xo/wuTgD7GdFaSGmi4fpUueNbsc=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-UryS_FWGOJCoOHQLXyJpgA-1; Wed, 04 Oct 2023 09:49:45 -0400
X-MC-Unique: UryS_FWGOJCoOHQLXyJpgA-1
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-7af49dcdb74so683611241.0
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 06:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696427384; x=1697032184;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=04v1Y2ap8PgeFJZuk9aFB8ktqtsNW3EnF+uSxtf2btw=;
 b=Dc+fEs9m2+9r0N7sdilR1DLYGrtoWyRvsvQFn2U4b7YUIG5wdB1cANzSJThBlsD3ck
 SFfBOh4VAjBZ4cMyVcAmP7s7/QGWogfmQwwUIWdsuC3N5NlImv/wx472ac2h3fUPavNm
 g1TPQhFJ5ddFMQDzb8ZT2gcidLQqg9Q2oqT8YzdVtR/jo2Js0K/i2pan/iwdwDJa/EiC
 uboDBzZnmRqLfUjOxM8n6boJDj1Hjhq9di5P1udqlrELol432XnksEByXN2c3rx2eDKh
 Dbcmi1k3c/8f/L4DqnljEQ4Zy11cL1CSTipeG8IivXontf+G+sDsZ9HiOJIIizQq4dy3
 6pzw==
X-Gm-Message-State: AOJu0Yw3gcplK0BQDdflJkh6vpr9Nozj3LllY+1t6jZl3x36AyWmwd0+
 tkMIMmC5f3ldyzFdtorRQj17cXNwkWBMMB2jb25vW1mqdPnJZiwphihJefRddlZF7nCqN/J54n8
 AnMoTZh+dF+Q3eVWDspvFxLfP2cLm
X-Received: by 2002:a05:6102:34f1:b0:44e:8353:e86a with SMTP id
 bi17-20020a05610234f100b0044e8353e86amr1908492vsb.24.1696427383906; 
 Wed, 04 Oct 2023 06:49:43 -0700 (PDT)
X-Received: by 2002:a05:6102:34f1:b0:44e:8353:e86a with SMTP id
 bi17-20020a05610234f100b0044e8353e86amr1908439vsb.24.1696427383128; Wed, 04
 Oct 2023 06:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231004090629.37473-1-philmd@linaro.org>
 <ZR1bjpEi5HdFp2xj@redhat.com>
 <85be2979-c0ca-3eb4-dae9-bbabf256c201@redhat.com>
 <00b2ec16-162e-9204-3a04-f45e0edeeb15@suse.de>
In-Reply-To: <00b2ec16-162e-9204-3a04-f45e0edeeb15@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 4 Oct 2023 15:49:31 +0200
Message-ID: <CABgObfZBTZZvcSPcMSRLWscyEz7B-2h9g28FJx7t7Ggux6E9cA@mail.gmail.com>
Subject: Re: [PATCH 00/13] misc: Rename 'softmmu' -> 'system'
To: Claudio Fontana <cfontana@suse.de>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: WfKXY9HCKQOh

On Wed, Oct 4, 2023 at 3:41=E2=80=AFPM Claudio Fontana <cfontana@suse.de> w=
rote:
>
> On 10/4/23 14:37, Thomas Huth wrote:
> > On 04/10/2023 14.33, Daniel P. Berrang=C3=A9 wrote:
> >> Am I mis-understanding what you mean by 'finishes' here, as
> >> I see many references to softmmu remaining
> >> In particular under configs/
> >>
> >> I was also hoping it meant that we'd be changing configure
> >> to allow
> >>
> >>      configure --target-list=3Dx86_64-system
> >>      configure --target-list=3Dx86_64-vm
> >>
> >> for less typing
> >
> > Maybe we should also bikeshed about the naming first... "system" is a q=
uite
> > overloaded word in this context already, and "vm" sounds rather like
> > hardware-accelerated stuff ... what about using something like "sysemu"=
? Or
> > "fullsys" for "full system emulation" (in contrast to "user space"-only
> > emulation)?

I agree that changing other remnants should be done right
after this patch, for example $softmmu in configure. Changing
all targets is a very large and very user-visible change, it is
required but it should be planned very well.

As to the actual target names, I think system is the only
consistent choice since we have --enable/--disable-system
(as pointed out by Claudio) and qemu-system-*.  sysemu
may make a little more sense in the codebase (we have
include/sysemu after all), but maybe that ship has sailed
since we have many occurrences of "system", for example
system_ss and other related sourcesets.

Paolo

