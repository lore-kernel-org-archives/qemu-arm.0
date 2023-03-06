Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4375964ejc;
        Mon, 6 Mar 2023 00:09:00 -0800 (PST)
X-Google-Smtp-Source: AK7set8E7k0Tj2WTvVfiB+4RAJvisUchI0JQDzYEb1IR3yG6N/JPCOVl8xkHZw72+XcqBMP4zJ1a
X-Received: by 2002:a05:6214:501b:b0:571:698:eac9 with SMTP id jo27-20020a056214501b00b005710698eac9mr23418925qvb.18.1678090140550;
        Mon, 06 Mar 2023 00:09:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678090140; cv=none;
        d=google.com; s=arc-20160816;
        b=DQZDer6AocF8TfTZB03hX04VanS5zteZIaxwDl3sW0l+IXOjZf9O/n6nEnfc+CThDe
         U4voKbqJ39SBh/xO6bb3PM+eor+xCUm29sOuFscNT172F3giqB8x516yBwo0RA/M2cm1
         BLyP4YvcEnZFKb44Fsk1QD9hUxJeyXRVB6snVtXGjHLWRZ6Cpv/eAHbHmUwIrj58B5dV
         KeckNQtoWX8QGZQZigRWSqvmXUDI9aveT2204HevAUqVeIb6MErH6ubCCrEc+TbLpzlG
         TnBOJ3CWHQXOIKvE0Qz9Frk+oJ/ghMhtD7nBgxUsSGwnsREP+uFBYJXwCETONSEF/H3C
         9YAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kqy6fbSmP/E0Ec01gKm1PxPNrukPZvjAV93d2I4SPH0=;
        b=kf/nRxmAp/IX7tnq6NALb7I9GS3wwcoE7opI+VTeps07kk250byEXJbNdgdA04tapd
         bKCPMe8chz3QSPWU5tl+nMK7XgOJ7m3e+0PoW4NIRS+gi5bTS7/Yt1m2rhgnUPMQJF1b
         cD9ZJjCQN8SWj2s3yrdlZbjkEU/+ryac2Bvk9rX5ApgA4oNr7TADCd00ceca4ZuhkzyS
         IOPt+BWkKEZA3BnPT3ILkbYrhZFjXtkXROvIUzrJvF23fo78ePibnvavDasw5gS72/98
         iuqpL//sJz9hxsXJN/ObDM/gd8MTbjfOTMQEvO5izlvp/fDmZbEfuJqoekAry2nkvtCI
         bAdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WjwIUL8/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5-20020a0c8c45000000b0058ce3ed4facsi965645qvb.9.2023.03.06.00.09.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 00:09:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WjwIUL8/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZ5tn-0006gp-96; Mon, 06 Mar 2023 03:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZ5tk-0006gG-Oc
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 03:08:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZ5tj-0006qc-9m
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 03:08:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678090122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kqy6fbSmP/E0Ec01gKm1PxPNrukPZvjAV93d2I4SPH0=;
 b=WjwIUL8/zwN5LzAUAdedIe91xsRWv8Z8WCtVKueHF/yYrW707IXm0VUon5oLiqFMhk7wB0
 L9TOEu3DRCx1zu2wTgkHc8IXxbz5iv1ui0m+gZHU5PP19B7uNlbtTaZKqDmygwAHwz8hny
 sbISEnZ2c16b03wqcoFNvjrGacCayQg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-nQWTzk6TNuWnHQEXGr8ZTg-1; Mon, 06 Mar 2023 03:08:41 -0500
X-MC-Unique: nQWTzk6TNuWnHQEXGr8ZTg-1
Received: by mail-ed1-f72.google.com with SMTP id
 m8-20020a056402430800b004cdaaa4f428so9766622edc.20
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 00:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kqy6fbSmP/E0Ec01gKm1PxPNrukPZvjAV93d2I4SPH0=;
 b=58CFbvFvo4C/EczauhlFW6NoNI++Hn1lPq0rI7gjy0vyTg0fhJvsiJwrh8RlUN1LH9
 iCTHwZAU7Y2Efx+kEdDYC8IMyXbJCcQ8gpnX13jkLU0YtJjzWb070TcqvSF7teUu/3QI
 ipCD7qP3oUwTps4MsrgXyehXPGXJiY6oX1aq4dSWlcFezhuBPWtnVghCiIjFDN3CP5zy
 abaa5PerAwLMnCUbzIG4f7KPCZe1fe2g1MhYaYLnqUmHXIK1IZs8KlYDd7BH6m8S+F1q
 280bUIrIYHkZk0Fs09gJOYcvqmoW30XzAlrA7YWalSQqyZUntphlK49Fp8UnpZ0xISKL
 TvDQ==
X-Gm-Message-State: AO0yUKU4GstAvUY+b/T0NIbclkIF1yFgLe/8ekP5U64sIRXgT8ryquDO
 19HgmH8VM52sFmL98nQV9SGNAi/5I2oT9QMLSf5g8A5vht0aU8+8jmO2fqj9/aShDrC+xjG+RUa
 +1j+fHfXZ10kY8YmaQGe1bH+klZgq
X-Received: by 2002:a17:906:388d:b0:877:e539:810b with SMTP id
 q13-20020a170906388d00b00877e539810bmr4726129ejd.2.1678090120009; 
 Mon, 06 Mar 2023 00:08:40 -0800 (PST)
X-Received: by 2002:a17:906:388d:b0:877:e539:810b with SMTP id
 q13-20020a170906388d00b00877e539810bmr4726116ejd.2.1678090119757; Mon, 06 Mar
 2023 00:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <CAMxuvawu4EWKpw_8sHGU-hVKeX_wZzpWqaRJo6kjbkYB45VWjw@mail.gmail.com>
 <cd4d82c4-6161-493b-073b-235141d6337a@redhat.com>
In-Reply-To: <cd4d82c4-6161-493b-073b-235141d6337a@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 6 Mar 2023 12:08:28 +0400
Message-ID: <CAMxuvawL9VEGC5HL9OMwXhxeVY_qSKFfORsMaW9OeV=tQ0OH1A@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] win32: do not mix SOCKET and fd space
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-arm@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com, 
 Peter Maydell <peter.maydell@linaro.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>, 
 Hanna Reitz <hreitz@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007d4fd805f636cd6e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KIQYWHUtfrmQ

--0000000000007d4fd805f636cd6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo

On Mon, Mar 6, 2023 at 12:05=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:

> On 3/2/23 15:09, Marc-Andr=C3=A9 Lureau wrote:
> >
> >
> >     v3:
> >     - fix closesocket() to prevent CloseHandle() from close()
> >     - fix direct closesocket() usage (#undef closesocket before)
> >     - add a test for &error_warn
> >     - add r-b tags
> >
> > ping  (I am missing reviews, thanks)
>
> I'm going to queue this series today if that's fine for you---thanks for
> reminding!
>
>
Great, thanks! (I suppose you'll drop "RFC: build-sys: add slirp.wrap", and
perhaps queue the other meson/wrap series instead)

--0000000000007d4fd805f636cd6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Paolo<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 6, 2023 at 12:05=
=E2=80=AFPM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On 3/2/23 15:09, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0v3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- fix closesocket() to prevent CloseHandle() from c=
lose()<br>
&gt;=C2=A0 =C2=A0 =C2=A0- fix direct closesocket() usage (#undef closesocke=
t before)<br>
&gt;=C2=A0 =C2=A0 =C2=A0- add a test for &amp;error_warn<br>
&gt;=C2=A0 =C2=A0 =C2=A0- add r-b tags<br>
&gt; <br>
&gt; ping=C2=A0 (I am missing reviews, thanks)<br>
<br>
I&#39;m going to queue this series today if that&#39;s fine for you---thank=
s for <br>
reminding!<br>
<br></blockquote><div><br></div><div>Great, thanks! (I suppose you&#39;ll d=
rop &quot;RFC: build-sys: add slirp.wrap&quot;, and perhaps queue the other=
 meson/wrap series instead)</div></div></div>

--0000000000007d4fd805f636cd6e--

