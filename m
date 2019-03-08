Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8200196wrx;
        Fri, 8 Mar 2019 02:31:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqzNCBwSBH1dc8Du3WKXd1lfZUWNOrFwIn+Wg/VQ2jDxvmQqzdWpr8PeEfZrIxBRbqCCgLrz
X-Received: by 2002:a81:b653:: with SMTP id h19mr14039613ywk.463.1552041107152;
        Fri, 08 Mar 2019 02:31:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552041107; cv=none;
        d=google.com; s=arc-20160816;
        b=Hyy1/EI4NO5/EpdVeYk6lgVSW9EZGbzCCGO7ygE4w2Dxvj3sEC4T15v4BZ6PA14jVP
         oCQF8kIzuKLg0SVvkw3HaF7dZpw3mL2rv19sNvUKLtHZHlK8Hnr98QbUaZkJodTp6u8+
         IYJNAmDQc8RsHqW/0Ep634+GIJYELPXWlOXWqL4B4a685mRyUiX94Q1w0wkEXHjTlw9t
         +evDGc53IzDxJtL/eC4PT6QKbLVjrpK9eoJM3DuUw9gHWtU4UGB7ByNwljjDUJEDrAeg
         zNzZ5PllnJNXlJjni3c98Jsk7Z5FenrDAkBBabOA4s0Jo7hRDeiFKjRzAeAdK3d8p6lF
         8JQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=04z8g7aQlbXa5sL4wYkrxT7QimRS43isxZkpXdDPNw8=;
        b=uFoKVMtDJLf/sORiaEToA/3KFw6ctCesQHOlNlWBHhV8gGwPROx/WUwquHkgYI69Cg
         TY/jg71+QjtmGNGZDc4cyON6jHn9aHOqsmQFC8J0nMlFSBa72nRYY6t5WIPJogThPexc
         MyYtuaMOTX+Dgi4PIvc331QJpHN/EwOO8v+RDvV1gUfeOXPlfGdovfdl+tTmnSM5z4uN
         DV6jxuxsPaT+w3J85f/vXQp16+IBKPjqOB9+rMY9xV0pN7eTNlhFVPkqA31YNAbJwXyL
         OvCTARgdb6UM2fkgmoG+pUg7qGhL07V36iVp6RnpTu/bRM0czbCr8TZEuz4dZZV+q09k
         RKeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si4407852ywa.279.2019.03.08.02.31.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 02:31:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Cn4-0006a7-HT
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 05:31:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2Cmn-0006ZC-OT
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 05:31:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2Cml-0002hC-U5
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 05:31:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57198)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h2Cmk-0002ee-1K; Fri, 08 Mar 2019 05:31:26 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46793804F2;
	Fri,  8 Mar 2019 10:31:24 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-151.rdu2.redhat.com
	[10.10.120.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C9295C1A1;
	Fri,  8 Mar 2019 10:31:13 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-10-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <9a4ee1fd-25ec-6113-496a-c5c4f51435f2@redhat.com>
Date: Fri, 8 Mar 2019 11:31:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190308013222.12524-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 08 Mar 2019 10:31:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 09/18] hw/nvram/fw_cfg: Free file_slots in
 common_unrealize()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pq0KbsR/3Y2K

On 03/08/19 02:32, Philippe Mathieu-Daud=C3=A9 wrote:
> Called by fw_cfg_common_realize(), fw_cfg_file_slots_allocate()
> allocates various buffers.
> Free them in fw_cfg_common_unrealize().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/nvram/fw_cfg.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index ca58d279a4..b73a591eff 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -971,6 +971,10 @@ static void fw_cfg_common_unrealize(DeviceState *d=
ev, Error **errp)
>      FWCfgState *s =3D FW_CFG(dev);
> =20
>      g_free(s->files);
> +
> +    g_free(s->entries[0]);
> +    g_free(s->entries[1]);
> +    g_free(s->entry_order);
>  }
> =20
>  FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
>=20

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
