Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10858874wrv;
        Thu, 25 Jul 2019 10:02:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwK4KNa+S78VjLZAF/34i+Jp8hs3k7xLpOWvxUESuE0LxM9sakHuE50xs5ftYzX5ly4Y8Iw
X-Received: by 2002:a37:9844:: with SMTP id a65mr59282360qke.500.1564074158951;
        Thu, 25 Jul 2019 10:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564074158; cv=none;
        d=google.com; s=arc-20160816;
        b=OIvQgO5lTbN2GOI2C3khfYcGoimsBr0heShIKAU7z5FhxLBnAJzdf25JdrhAd0l7mT
         nu3hmE+rj/2qvcXWsFxm9wOYS+jv+Ity+ZilGrqk5j0raP7v+qJgd8APeB0z5HDGxjFP
         9hxA53834/GbxqOcwZWtQF0t5HOAeUIXtxztJW3+Rip6jIp/J5geYZuQopk9w+JdQ5/v
         Z42RP+a39VR9f3sJsUT3GVPR0kiF2wU7br5GtQIRVwx3F5srxyuUFBe397menHNBkyR6
         NDdPpBNIKHnXqk9oRL5WO2tVUw66yhoWn9BgKOphDdLX5zXGJOXfYlEr81k0PoPzhBPk
         4CCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=Z0qBV3DJRWxMcKJTK8lLECLpyqQLelA3yVsNB9uTgkA=;
        b=Oav5wx2q2htiZUREPghdlQIEpj+GyVORbn62N7zwueG5MpjG33ICR2YEk80igyaZy/
         m5CIR1bC82QmeNSwfBMzgVLztYFQVEucaWw+996DDCSaq3TWVgic/XC8sIbZygSh5xb2
         1UWPYe71U2QEYLC5+ADapj08o8K6yw345DQtIJun+uE2xg1C0zXx7k4urOYH/xZTyzr8
         grnMkRdLiWnxQ9ec1/yJqjvCwiMUYMEFcDxsgWsAkLmH2zZN+veOFbO6J/p1fDHvkabz
         0wg44KQE6r8cZAC0rQA7HtigcXkho1RvAP2NyR4SrG3FYdo2tlYqph5BemhzTnfOPLl4
         Cl4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t64si29063496qke.110.2019.07.25.10.02.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 10:02:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqh8Y-0007Kr-BO
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 13:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52226)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hqh8V-0007KY-19
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 13:02:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hqh8T-0005vR-RK
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 13:02:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36378)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1hqh8T-0005u5-Js; Thu, 25 Jul 2019 13:02:33 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3D39930BC58B;
 Thu, 25 Jul 2019 17:02:32 +0000 (UTC)
Received: from work-vm (ovpn-117-187.ams2.redhat.com [10.36.117.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B9141001B07;
 Thu, 25 Jul 2019 17:02:30 +0000 (UTC)
Date: Thu, 25 Jul 2019 18:02:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190725170228.GL2656@work-vm>
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725163710.11703-2-peter.maydell@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 25 Jul 2019 17:02:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.1? 1/2] stellaris_input: Fix vmstate
 description of buttons field
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wrw82QAVZ+mE

* Peter Maydell (peter.maydell@linaro.org) wrote:
> gamepad_state::buttons is a pointer to an array of structs,
> not an array of structs, so should be declared in the vmstate
> with VMSTATE_STRUCT_VARRAY_POINTER_INT32; otherwise we
> corrupt memory on incoming migration.
> 
> We bump the vmstate version field as the easiest way to
> deal with the migration break, since migration wouldn't have
> worked reliably before anyway.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

OK, it would be great to change num_buttons to uint32_t and make that a
UINT32 at some point;  it's hard to press negative buttons.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/input/stellaris_input.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/input/stellaris_input.c b/hw/input/stellaris_input.c
> index 20c87d86f40..3a666d61d47 100644
> --- a/hw/input/stellaris_input.c
> +++ b/hw/input/stellaris_input.c
> @@ -60,12 +60,14 @@ static const VMStateDescription vmstate_stellaris_button = {
>  
>  static const VMStateDescription vmstate_stellaris_gamepad = {
>      .name = "stellaris_gamepad",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
>          VMSTATE_INT32(extension, gamepad_state),
> -        VMSTATE_STRUCT_VARRAY_INT32(buttons, gamepad_state, num_buttons, 0,
> -                              vmstate_stellaris_button, gamepad_button),
> +        VMSTATE_STRUCT_VARRAY_POINTER_INT32(buttons, gamepad_state,
> +                                            num_buttons,
> +                                            vmstate_stellaris_button,
> +                                            gamepad_button),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> -- 
> 2.20.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
