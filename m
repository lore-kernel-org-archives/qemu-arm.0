Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1360574lfg;
        Thu, 6 May 2021 08:08:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjlp9iYx0kBpi/jw5qlBgVRwqyI9SGzNPK7p0UtCw/ER3xkkCFPTtp3EOnyrwGKF0VzMQy
X-Received: by 2002:a65:4382:: with SMTP id m2mr4749011pgp.354.1620313729964;
        Thu, 06 May 2021 08:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620313729; cv=none;
        d=google.com; s=arc-20160816;
        b=hGmxThlCMWB+79e8ijG7vqtsOWyhd3KVgnF+/MJS2hPE+wY64qJ3qikE++9hzBLlXx
         sl40SA2El49eafGf54L3Bs0LlXfc/3TtWQCM+wNoNY8Q6Ul9zScfPu3z8xWpKhPYbu7G
         1c5TlyYdjhuEnuXDn9x4dLM/L6OGwrsBnY6Kqrd2qh44MmbeNBbrJEX7rukYfPRDLS2/
         t5zXsNBPzUvnryufejOGd8fZIhKsHA3YfMWecWsftNaikFZrfT36VyxYldWDc1PBPwmv
         IOE2dDeic+1dlcrRcf9NHsEmkgiYQ6miu6t5Cv5wreJzQSpQjZ/O72Irds4LDE/vzTNd
         Cevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :message-id:in-reply-to:date:subject:cc:to:from:user-agent
         :references:dkim-signature;
        bh=m9ewp5iHxi2zbqQP2rkue2ZUEh3U6+WHn2wG8f4/C6w=;
        b=KO64wzbZb3oRFdFYcuqf1BK2/naK8y/mp6gePfSh/pp5wbWeqXqRAl0aH8KGgA7j4q
         LBIo+ktrXp3evvvXMpozSMT8wGZtK+zfNjXhpMP3GTz/6mqK2N+XFZ/oRtX/06x5NewL
         K1GWk6yDHdoesOEL4U0Vlt+mpstnQv8n7RY2DkELOeuAxNIBMuLGXPxMtMe2YbihVdSC
         Upget5ezVpyE8TMGv6n7SrvKiXkRLuveKN0skuuFzt7/1NDJXmEXgWfwyroKh6Sg9yEl
         rugOBhEN1ZlB0+p2l59Kxx92ubwodjwYem0Uo7ErRbJxU/rSKtiPWG0aDNIgxxH04OM4
         fY7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ORa6GITT;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id g17si4240992pge.164.2021.05.06.08.08.49;
        Thu, 06 May 2021 08:08:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ORa6GITT;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235050AbhEFPJr (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 6 May 2021 11:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51194 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234888AbhEFPJp (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 6 May 2021 11:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620313727;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m9ewp5iHxi2zbqQP2rkue2ZUEh3U6+WHn2wG8f4/C6w=;
        b=ORa6GITT1Yq6uYYDw07jeqatPq9gWVJu0p9OS2xuktVLV7toUP+lX2XoR8wjobJZ5/Tvpk
        vs1jCK/lW0vnKSG+NLnfQjO40lxBEGlc8LUYRTCGLRvKlZmW9GB1iARHGrA0EiQoiVZjEk
        AZ616suVORP7eGxiNLTar32iginPabk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-5HaQkt4_MJyW9Z20B_Obnw-1; Thu, 06 May 2021 11:08:45 -0400
X-MC-Unique: 5HaQkt4_MJyW9Z20B_Obnw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47AE76D5C8;
        Thu,  6 May 2021 15:08:44 +0000 (UTC)
Received: from titinator (ovpn-112-210.ams2.redhat.com [10.36.112.210])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B67AC16909;
        Thu,  6 May 2021 15:08:38 +0000 (UTC)
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-3-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 27.1
From:   Christophe de Dinechin <dinechin@redhat.com>
To:     Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc:     qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
        qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/9] backends/tpm: Replace qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
Date:   Thu, 06 May 2021 17:07:11 +0200
In-reply-to: <20210506133758.1749233-3-philmd@redhat.com>
Message-ID: <lyr1ij6gsr.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: CfEoC4VA5Gi1


On 2021-05-06 at 15:37 CEST, Philippe Mathieu-Daud=C3=A9 wrote...
> Simplify the tpm_emulator_ctrlcmd() handler by replacing a pair of
> qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
> macro.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  backends/tpm/tpm_emulator.c | 34 +++++++++++++++-------------------
>  1 file changed, 15 insertions(+), 19 deletions(-)
>
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index a012adc1934..e5f1063ab6c 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -30,6 +30,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qemu/sockets.h"
> +#include "qemu/lockable.h"
>  #include "io/channel-socket.h"
>  #include "sysemu/tpm_backend.h"
>  #include "sysemu/tpm_util.h"
> @@ -124,31 +125,26 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, u=
nsigned long cmd, void *msg,
>      uint32_t cmd_no =3D cpu_to_be32(cmd);
>      ssize_t n =3D sizeof(uint32_t) + msg_len_in;
>      uint8_t *buf =3D NULL;
> -    int ret =3D -1;
>
> -    qemu_mutex_lock(&tpm->mutex);
> +    WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
> +        buf =3D g_alloca(n);
> +        memcpy(buf, &cmd_no, sizeof(cmd_no));
> +        memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
>
> -    buf =3D g_alloca(n);
> -    memcpy(buf, &cmd_no, sizeof(cmd_no));
> -    memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
> -
> -    n =3D qemu_chr_fe_write_all(dev, buf, n);
> -    if (n <=3D 0) {
> -        goto end;
> -    }
> -
> -    if (msg_len_out !=3D 0) {
> -        n =3D qemu_chr_fe_read_all(dev, msg, msg_len_out);
> +        n =3D qemu_chr_fe_write_all(dev, buf, n);
>          if (n <=3D 0) {
> -            goto end;
> +            return -1;
> +        }
> +
> +        if (msg_len_out !=3D 0) {
> +            n =3D qemu_chr_fe_read_all(dev, msg, msg_len_out);
> +            if (n <=3D 0) {
> +                return -1;
> +            }
>          }
>      }
>
> -    ret =3D 0;
> -
> -end:
> -    qemu_mutex_unlock(&tpm->mutex);
> -    return ret;
> +    return 0;
>  }
>
>  static int tpm_emulator_unix_tx_bufs(TPMEmulator *tpm_emu,

I really like the improvement, but it looks like it does not belong to the
top-level series (i.e. not related to replacing alloca() by g_malloc()).

Reviewed-by: Christophe de Dinechin <dinechin@redhat.com>

--
Cheers,
Christophe de Dinechin (IRC c3d)
