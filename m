Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp7272230wrr;
        Fri, 15 Nov 2019 12:12:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqy0pc6E4ybsSpAN+OrW1ffSxm/xnyeUc3nBkkTYBgvdk4QwDOXy2E5C0Kf1189xg93NTEra
X-Received: by 2002:a17:906:c57:: with SMTP id t23mr3467135ejf.240.1573848740662;
        Fri, 15 Nov 2019 12:12:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573848740; cv=none;
        d=google.com; s=arc-20160816;
        b=tHWhQVFg42xoMU/6IkoHz1QaPowCYfV0NAXuRNy2VUGX4u5TKJAJj39I1e+Ef4oXvb
         L3remCIlgZ9v/ltKV50hvCOTHtMYc4YVj7Zl8xOLv/Wbl//kuZ6PprirBkcC6ktoXT4+
         Axdv/kmGq/hRkbwt4yvE1c8MPTdbdDKNtushHCrzXsIov7hsDT+OF2VMOdVgEUB+g9mV
         SN9R0gLYwAS85DbIPV1QDOt8iJXezLPWa8lwPfyqcTg8vmYgIRfa6SHZ/l12VFVNTnBD
         mXYDz4FKHjpPDB+Cj3OX89D+RFLVm4UcxF3i9CWfB9g7yakScO+RxLc+Z/1l3E3SD2qm
         Qp7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kBYDGqU/WfUq93T5hjLjgiKJXX0T6WRRp3iGpzNC4Y8=;
        b=uNS2Sp/T5rUPnIFhTxMZEVEHKa2EKn+4+R60XuXI8aAPKTpV/Haa9T5nZtZRM0LAJ9
         OinqVGP53w9CyXEbAH7JKPSYFbU1g5Rscm5e/SvbRy7LUtr+toktNpcTfDEpdGESC78L
         eVBq+nOs+wStQJ2ud062TJLGm5Mtu2weCvKSHubOjJgWdx80nSKDwt8Fxg/M8Irgw6XO
         p7VsfLz2+m4aGI83K9c/jsh46i+CstrN2g1tElDc+sDzCjz7puBdfKKndXgKmQOiyQKL
         gEZ+in8Sls05wSGuSTX2r9elbamR7spIaO6tMzUUIhcSusCx28SxYISjXU3TQiJna3w7
         D1uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FWmCHbI5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p20si6185333ejj.394.2019.11.15.12.12.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2019 12:12:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FWmCHbI5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVhx5-0005xI-M8
	for alex.bennee@linaro.org; Fri, 15 Nov 2019 15:12:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41543)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iVhwx-0005wj-3t
 for qemu-arm@nongnu.org; Fri, 15 Nov 2019 15:12:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iVhwv-0004kS-OY
 for qemu-arm@nongnu.org; Fri, 15 Nov 2019 15:12:10 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58773
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iVhwv-0004k0-LM
 for qemu-arm@nongnu.org; Fri, 15 Nov 2019 15:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573848728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kBYDGqU/WfUq93T5hjLjgiKJXX0T6WRRp3iGpzNC4Y8=;
 b=FWmCHbI5B0ZDF5yxMi37ZmszpEjk7GFezgtFloDce70HdR9H1OFyl/I84La95paAaOXbTF
 2G7uaIjMD781HTZgfwRHs3BA4XfDsaagGDQ8j4KJCnkCeFBewwDd7SUQ1YoLMFGHWouHkp
 Z0QM74nn5epr9tpUQ4PgivHt5HctQIU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-79JMNuWfNme_XmxmeUVgaA-1; Fri, 15 Nov 2019 15:12:05 -0500
Received: by mail-wm1-f70.google.com with SMTP id y133so6809708wmd.8
 for <qemu-arm@nongnu.org>; Fri, 15 Nov 2019 12:12:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ffnsX0Q8XR2BjS9unAeGmtupJtx5eeTPlTk4cVQD4dw=;
 b=W/+kkqZtMz8fyrqx5eMSQeuxAgt2c/vrM6RpyG1wh5R9G4csPGiJeq/Xt1SsEGxAhi
 n7bgiOSysregDyS6CUD6u3wLPaXvkyBV1w5tFWt7ZUNBOjXEr9gBfL/Su+UXcIAfAmGf
 qcOXJZ9Fj7O1nwivb8+zMBls8G7v3xVRN30Cn5SV+cvHgFXWVvwklpPekISiPzeD9+/S
 MIRd+H0tzhJr3IoSkXBsvwVUqecwUaDXPa4JuEziE8u/6XV3HBU77EMfUFj1q1PqoyZ2
 +LmQAFx6+K8Aamj25Mg8zG8BgZUEIeBBQiEulVSjQnxDB37WU+DttLjW/Gv8Tb42xtVa
 kjKw==
X-Gm-Message-State: APjAAAXRMmH/XLDDqeKSvOFAEEPd09GrCm5UcLpAyTUq0hES077KT8QJ
 bJDdDjqY63f+k57Hlu5f+6/qXZOh37+cWoTBXJE1ugx55rQeRgy1i7FqAVxJHOHHGWrGChRv2Lw
 BYFp7UGxSOYrP
X-Received: by 2002:adf:ef86:: with SMTP id d6mr1286183wro.118.1573848724237; 
 Fri, 15 Nov 2019 12:12:04 -0800 (PST)
X-Received: by 2002:adf:ef86:: with SMTP id d6mr1286146wro.118.1573848724000; 
 Fri, 15 Nov 2019 12:12:04 -0800 (PST)
Received: from [192.168.1.35] (170.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.170])
 by smtp.gmail.com with ESMTPSA id z9sm12686998wrv.35.2019.11.15.12.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2019 12:12:03 -0800 (PST)
Subject: Re: [PATCH] display: xlnx_dp: Provide sufficient bytes for silent
 audio channel
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 KONRAD Frederic <fred.konrad@greensocs.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <1573833408-2388-1-git-send-email-sai.pavan.boddu@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c3690658-245b-7ebd-a58a-8f665ac16ac5@redhat.com>
Date: Fri, 15 Nov 2019 21:12:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1573833408-2388-1-git-send-email-sai.pavan.boddu@xilinx.com>
Content-Language: en-US
X-MC-Unique: 79JMNuWfNme_XmxmeUVgaA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QmQpbV4srjaY

Cc'ing Gerd (Audio)

On 11/15/19 4:56 PM, Sai Pavan Boddu wrote:
> Fill the audio channel with required number of bytes to cover the
> elapsed time. This prevents rate control reset, and avoids debug prints
> like below
>=20
> log:
> =09Resetting rate control (65692 samples)
> =09...
> =09Resetting rate control (65721 samples)
> =09...
>=20
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>   hw/display/xlnx_dp.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index fde3b21..7058443 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -394,13 +394,18 @@ static void xlnx_dp_audio_callback(void *opaque, in=
t avail)
>               written =3D AUD_write(s->amixer_output_stream,
>                                   &s->out_buffer[s->data_ptr], s->byte_le=
ft);
>           } else {
> +             int len_to_copy;
>               /*
>                * There is nothing to play.. We don't have any data! Fill =
the
>                * buffer with zero's and send it.
>                */
>               written =3D 0;
> -            memset(s->out_buffer, 0, 1024);
> -            AUD_write(s->amixer_output_stream, s->out_buffer, 1024);
> +            while (avail) {
> +                len_to_copy =3D MIN(AUD_CHBUF_MAX_DEPTH, avail);
> +                memset(s->out_buffer, 0, len_to_copy);
> +                avail -=3D AUD_write(s->amixer_output_stream, s->out_buf=
fer,
> +                                   len_to_copy);
> +            }
>           }
>       } else {
>           written =3D AUD_write(s->amixer_output_stream,
>=20

