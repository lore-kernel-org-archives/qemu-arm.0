Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7383AC79F9E
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 13:23:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3ZJN-0002Lp-Ic; Mon, 07 Sep 2026 09:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1x3ZJM-0002LG-IF
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 09:23:00 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1x3ZJK-0007d2-UQ
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 09:23:00 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-7eb6573bd52so3374641a34.3
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 06:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788787376; cv=none;
 d=google.com; s=arc-20260327;
 b=mE9TLiRg9ZJlCVHMXnDrqVwJXdM5MZIJ2PqDe7KnZxeB3/COvXOEZmsPqZRnoFUmA/
 JzRT7nwdyj7J/H3jRuMb+iMsMblhAhW05Uzfro7no+HYLmMg/kru5wxMARQ7kB4L4+13
 ingNWQZ2ZKsH6Qr5Mo6+s+jQ63IEHt5WbhuW61yqHPKc82K0SshJDer2gCldPOGIP9o5
 NmyudxtmpBEs+h714LMxtAZA53VnW52Ju+iuhBquVEvhrK8q+Koba+ZmcomEBDSdPHIl
 CCCsoSWxZdyIns83bFur4caUVt4vZFwf3cqkk+5owj5SDrQVDZ/QKU+OKkjXA7ogwxON
 H5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UlmXn5XFwHuu5bAKOSvrcrxBAOgoLVaDqZUm5RWuyMU=;
 fh=LMxJ8qXKJDpgAV7Q5hUhZyFjK3vXmhMTOjOrSeLnlHA=;
 b=HZF1yNjxKvh+jutba5dQJ0bhNOaeDYnAkELuK4Yfn+2rqZ/9Si74oDEf++vd+Low1G
 H+L6LH2in0z66dwSD31TUK2+wDDRql29UpDwyLBIZtqMsHK/0Q3ZvoTr0ViTer7OaFdo
 oJuWE4VO+QE/rbmCmefR1RwOj/rb5DgAlphD/0VQ5RXIWqEcvdGsHfzQ/XivX1YPHyuC
 sS39UnYx54ZnBp8CgHgEo6vbR2oyks9u+Zxe/pj/gEMB531fhnSQ4pT+uJ8vO6qQgHv8
 NMEpulO8ixO7uR15GrEQGRhuh3yOEeYy0MdizFZ3oRb76mZ/fJnuX1M7UKZACaGVJGJk
 2g4w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1788787376; x=1789392176; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UlmXn5XFwHuu5bAKOSvrcrxBAOgoLVaDqZUm5RWuyMU=;
 b=HbkN4irLTsJN0Ke/lC0VWmSNMB2WfmnQMDpoD1gYChrjvJEwtgBj2TD0B/6jP+8W7A
 ayT4fJ4DhzhXKeh0TmqwQQEU9S71279+gL8dt1ZpRPBy37oLjg6fljzqMk7sXADHy8qx
 lx8joO6QgIN+iTGq2ptbLEmYe6c4RcfbsS24zzM/rxWWroyHmCGJOypk+FzVFlc1EtDe
 ivUbuspy6trU7DkWx5WN0AekaitW5l06oiiycFC1t+yixtl+pPOW7QuKutZKyjfkzmgL
 PEVIW97aktRaGp1z31cubHt73ZMx+M/oG3RLJdn+eT6GgtT+5ihfhhc7STb20Ahez6aY
 EV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788787376; x=1789392176;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UlmXn5XFwHuu5bAKOSvrcrxBAOgoLVaDqZUm5RWuyMU=;
 b=Ax55Pa1/AoK0Y2RGuXGPOEZ0BKtoaZveNNZm+XSiKocTUiCTphZsg7qatWMrLxHKPF
 G0KSBS2J0auXkKImIu5WupOYnOdgDgxzJ45x3rmH1WDj3foFlhIi15ezdDxiBQUNee2E
 44cBYmM1EQ2lTl8te4G6hpMAwf3lanMiEO6nbWrCH3ZzypygmeDTIh2zNkjn0EXcDaoO
 G1xSfSbAQaGps8hdzo1p01AunEx0uOZkKzq4HzHpbCqVxxG85QoFYVPNjae1++mKRBjl
 UV/ze75alK+5lrf96cOXYZSELZDqWF1dJGl9zrORz2r4/2I/rvWA4pXZf3m6su3WuvTH
 Bsrg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzCcwXs1eLinX4XbLyI7RAOY4I3wGgn9x/hgTCb0Kd21BKshYm//7EPTYQ5ZmY5I1gNV8n793taZA==@nongnu.org
X-Gm-Message-State: AFuF++llG6LA+4wHNjgiUEKwcWfJARh8EL76oNxAGqjQWlvCRN+feFsF
 gzq6R0zh4qYEZu1VW3PqihPiuoFKNPz//fRuck90Q2h9/QBy4QGQ3o7dXxoEJmD3I7fnkxvH4nk
 TwB5uzq7m1i5LkDd7+Jg3pw9P4/pT98U=
X-Gm-Gg: AYBFou2PKqc9sGMikCUpWL1aoh5zSzH5j5wbWeOaX0dxUuLccwrQ4qB3EECa+Aw8o6M
 Wo2R5R2BtXMQ7KH/k7eyffXeFMYLeH1vun0b9J1z6vrgIGrmpOrTbJnnTCSlQfUvYzCf/vi66eH
 +nQsTEnqG1j2xzp8t0npb6mFfPk/vNL6oD3TvbOFozuabuqQe9xOoxuZXTWCierr/TO29qWHLRs
 Vocd0k+cg+KtjmFa7I89BRRHclm039XmZJ8+5lLZvp+0W905NB60XZmJfWPk72/LYtqlUX7Jmii
 NEtEorZSPpftCeDdl6S6JoJOI/179UYiDGdRrZxgk9Vglc7e+V+vgKYZznApxJ2pg/qVSYCMSz6
 W
X-Received: by 2002:a05:6820:1798:b0:6b7:46fa:16a3 with SMTP id
 006d021491bc7-6b746fa1addmr11834654eaf.56.1788787376091; Mon, 07 Sep 2026
 06:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260906-nohmp-next-v1-0-2b21e63974f3@redhat.com>
 <20260906-nohmp-next-v1-2-2b21e63974f3@redhat.com>
 <20260907075640-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260907075640-mutt-send-email-mst@kernel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 7 Sep 2026 17:22:43 +0400
X-Gm-Features: AcwNN1XnN-2oQKhD7NPPvTaTB_Rq_yBoi6aT19bR1t2Pdi1NvCovgqYOfupJBS4
Message-ID: <CAJ+F1CJfjvYWRW1Az=1Q2vUMM+RS56-_a5ugLbepeznHm8pvxw@mail.gmail.com>
Subject: Re: [PATCH 2/9] tests/test_vhost_user_bridge: skip when running ASAN
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Brian Cain <brian.cain@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 Gerd Hoffman <kraxel@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Jared Rossi <jrossi@linux.ibm.com>, Zhuoying Cai <zycai@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Jason Herne <jjherne@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi

On Mon, Sep 7, 2026 at 4:03=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> does not look like this patch skips any tests?
>

true, I will update the commit title

> On Sun, Sep 06, 2026 at 12:53:34PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Running vhost-user-bridge built with ASAN with stdbuf dies:
> > =3D=3D2431898=3D=3DASan runtime does not come first in initial library =
list; you
> > should either link runtime to your application or manually preload it
> > with LD_PRELOAD.
>
> so it dies but why? judging by below because of stdbuf?
>
> pls describe the fix not just the problem.

Running vhost-user-bridge built with ASAN with stdbuf dies:
=3D=3D2431898=3D=3DASan runtime does not come first in initial library

The fix skip using stdbuf when the binary is built with ASAN, since it
seems optional anyway

>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  tests/functional/x86_64/test_vhost_user_bridge.py | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/tests/functional/x86_64/test_vhost_user_bridge.py b/tests/=
functional/x86_64/test_vhost_user_bridge.py
> > index c36c62542053..5fedf61c5e72 100755
> > --- a/tests/functional/x86_64/test_vhost_user_bridge.py
> > +++ b/tests/functional/x86_64/test_vhost_user_bridge.py
> > @@ -73,12 +73,25 @@ def configure_vm(self, ud_socket_path, lport, rport=
, hostfwd_port, tftpdir):
> >              "-netdev",   "hubport,id=3Dhub1,hubid=3D0,netdev=3Duser0"
> >          )
> >
> > +    @staticmethod
> > +    def _is_asan_linked(binary_path):
> > +        try:
> > +            output =3D subprocess.check_output(
> > +                ["ldd", binary_path], stderr=3Dsubprocess.DEVNULL, tex=
t=3DTrue)
> > +            return "libasan" in output
>
>
> this is quite a hack

yeah

>
> > +        except (subprocess.CalledProcessError, FileNotFoundError):
> > +            return False
> > +
> >      def assemble_vubr_args(self, vubr_path, ud_socket_path, lport, rpo=
rt):
> >          vubr_args =3D []
> >
> >          if (stdbuf_path :=3D which("stdbuf")) is None:
> >              self.log.info("Could not find stdbuf: vhost-user-bridge "
> >                            "log lines may appear out of order")
> > +        elif self._is_asan_linked(vubr_path):
> > +            self.log.info("vhost-user-bridge is ASan-linked: skipping =
"
> > +                          "stdbuf to avoid LD_PRELOAD conflict, "
> > +                          "log lines may appear out of order")
> >          else:
> >              vubr_args +=3D [stdbuf_path, "-o0", "-e0"]
> >
>
>
> maybe just avoid stdbuf completely.
> i don't remember why we use it, but it looks like merely to
> disable buffering for stdout?
>
> If so:
>
> setvbuf(stdout, NULL, _IONBF, 0);
>
> will do just that with no asan issues.
>

That requires modifying vhost-user-bridge, not sure that's what we want.

thanks

