Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1810437ejc;
        Fri, 13 Oct 2023 15:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+F7JatscwzPuHAIVPJBWr5C+GR8CcfMcaXC4TEDVzluHeVfUcaz/goceq29EQUi1g1hV/
X-Received: by 2002:a05:6214:528a:b0:66d:f91:fa33 with SMTP id kj10-20020a056214528a00b0066d0f91fa33mr8277134qvb.29.1697236091439;
        Fri, 13 Oct 2023 15:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697236091; cv=none;
        d=google.com; s=arc-20160816;
        b=xoHwEZAFOSd17ILVpBR+scNx/QWw2rYQWBDxlhdLbaRtZUjDsBLoTB2N03HeLA0gW3
         nqgoU6n5k7hn+tmOTE9VoQcVXstsgSG4PzdkhjjfHCPOVpaRR9H7a/QNbIMx/hYb9VU+
         gjrQL3Ng9NxFRrzTWjgPneDMX17YcixkhzQnbtmlh/OMxr+r5axQ1O3cQeG4ulkeIHln
         OP6akLo6O5z4sEC5M3lFyU91P/rR3mhsCO2XoikqRkP6LhP13MhB37MdWEKx0wD9/zH6
         kkVpaqusKOplHcQkDrCHlN17do63dNg1KRx62AsrPu3peTRpdf/NUu3CcWuWl2F7AWUX
         fI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FbzJ4p59VknbHdZo5j906NmNiX8r+Ge50Ay/6i/dIjg=;
        fh=WqFkrZKGvMj0jGEvOALcjVPt/SUTOjrHROxU/nT+zJg=;
        b=FbytqNR58FMsgNIwnQ+IIuk/cMJnK4PukAVk/Ia9vV0TWsfVI9KwSghXS6JHAeOqHS
         NMW4JmJaADShAAe8MXHGXkurMpqqa7p1HfnYj15n1+QhiLi6gl/LgNJKsdme1DrAI2g/
         coUfKMY9kCAZCyrG2B6C0MEVh8X0ps600/H3M7TZ+Gy/Vzle7VXEb3CFCWnu6E6aUTE7
         Wms5rkocs+caxVKAC0zGTpbri2Y2Uuot2/iieR2bJcYYD+TzcghZKDz3S2JqTIfO++lu
         TtjICG+MmVrRmdRmtEzMfOP5uoG4LcFpfpq90Yfi7oQ+KgqT+mQF4t/eB8valoooceci
         pZSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W+LLWnnR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020a05620a24c200b00773c43e5e5dsi1989973qkn.651.2023.10.13.15.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 15:28:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W+LLWnnR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrQdH-0006e7-El; Fri, 13 Oct 2023 18:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qrQdG-0006dx-C0
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 18:27:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qrQdE-0002Bp-Ub
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 18:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697236064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbzJ4p59VknbHdZo5j906NmNiX8r+Ge50Ay/6i/dIjg=;
 b=W+LLWnnRpMqyVBzcgNG07JCj8WgQngTzFXhAaQrj9KYSmNsvUqCb2S2sfUOIbVYi0C5+pf
 7PyhceHkIdZ/Y8n0v90xEji9YC5hk+eMkxXhuNyF1xpS9xvvcWc6CH8U9XUppXSKtsc84l
 wCzHQjcS6dgrfpNpipYGAdDprUQWe8s=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-bQDUfonIN7q9xvgmIPPHpg-1; Fri, 13 Oct 2023 18:27:37 -0400
X-MC-Unique: bQDUfonIN7q9xvgmIPPHpg-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-1e170528d43so3166872fac.1
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 15:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697236057; x=1697840857;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FbzJ4p59VknbHdZo5j906NmNiX8r+Ge50Ay/6i/dIjg=;
 b=fT09DeAWkmhvIXunZkkeuWXsd+15YlmtJUyI4uA89/NSH5HXPmbjK48wne076z+7St
 Ffc8QAqocx8RBGH04m9B/CAjl4Pu1PiaqbB3BLKKA3cyd5MhZC1wo4v7p3ft4maFNI3R
 4mGd0TD+pk+CL1gq0uoL8nxzkxctYvM52owiVuQS7FIJgDCzB6TLgpoqXCTT+bE7d6Ru
 8ODu0sS9AV47kPnDEJBuMFl4LaVJNu+4r8Z+NZO7965mhv1fCFr5oknyzdsGq3jOHpJi
 mFDSlibJwN759ZRlBXh1Hsy02LoLSaVq5qv7G34c9aoh7Fvj/knLNJ/k7mBHZUKwqM2V
 Y8JA==
X-Gm-Message-State: AOJu0YyDoIpdyl1vvC8XZYIGlogTjqdPy3V/Sl+FkvAp56ZUGtkOPzd6
 uqAj9OTEJ0D0GWAFYdQON10BfAXPCEe9p2tF6txzdZOVNkC2nt3AkMYFeayZJ3gZwPt4yFCOhHu
 0PDCv3/8JKjOXBjA6zu/HdK0cEjTW
X-Received: by 2002:a05:6870:2381:b0:1bb:99fe:6ad1 with SMTP id
 e1-20020a056870238100b001bb99fe6ad1mr33847662oap.6.1697236056821; 
 Fri, 13 Oct 2023 15:27:36 -0700 (PDT)
X-Received: by 2002:a05:6870:2381:b0:1bb:99fe:6ad1 with SMTP id
 e1-20020a056870238100b001bb99fe6ad1mr33847644oap.6.1697236056513; Fri, 13 Oct
 2023 15:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
 <cef77c3b4f13c967f371d203d1aba515b05f3555.1697183082.git.manos.pitsidianakis@linaro.org>
In-Reply-To: <cef77c3b4f13c967f371d203d1aba515b05f3555.1697183082.git.manos.pitsidianakis@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Fri, 13 Oct 2023 18:27:25 -0400
Message-ID: <CAFn=p-ZZmrB3LtqAAm1wDB4b1mk6QDq9jz_giSR7TpD9Vkxg0g@mail.gmail.com>
Subject: Re: [RFC PATCH 10/78] hw/ide/atapi.c: add fallthrough pseudo-keyword
To: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: dDlRZN1TeznE

On Fri, Oct 13, 2023 at 3:50=E2=80=AFAM Emmanouil Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> In preparation of raising -Wimplicit-fallthrough to 5, replace all
> fall-through comments with the fallthrough attribute pseudo-keyword.
>
> Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>  hw/ide/atapi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
> index dcc39df9a4..85c74a5ffe 100644
> --- a/hw/ide/atapi.c
> +++ b/hw/ide/atapi.c
> @@ -1189,53 +1189,54 @@ static void cmd_read_disc_information(IDEState *s=
, uint8_t* buf)
>  static void cmd_read_dvd_structure(IDEState *s, uint8_t* buf)
>  {
>      int max_len;
>      int media =3D buf[1];
>      int format =3D buf[7];
>      int ret;
>
>      max_len =3D lduw_be_p(buf + 8);
>
>      if (format < 0xff) {
>          if (media_is_cd(s)) {
>              ide_atapi_cmd_error(s, ILLEGAL_REQUEST,
>                                  ASC_INCOMPATIBLE_FORMAT);
>              return;
>          } else if (!media_present(s)) {
>              ide_atapi_cmd_error(s, ILLEGAL_REQUEST,
>                                  ASC_INV_FIELD_IN_CMD_PACKET);
>              return;
>          }
>      }
>
>      memset(buf, 0, max_len > IDE_DMA_BUF_SECTORS * BDRV_SECTOR_SIZE + 4 =
?
>             IDE_DMA_BUF_SECTORS * BDRV_SECTOR_SIZE + 4 : max_len);
>
>      switch (format) {
>          case 0x00 ... 0x7f:
>          case 0xff:
>              if (media =3D=3D 0) {
>                  ret =3D ide_dvd_read_structure(s, format, buf, buf);
>
>                  if (ret < 0) {
>                      ide_atapi_cmd_error(s, ILLEGAL_REQUEST, -ret);
>                  } else {
>                      ide_atapi_cmd_reply(s, ret, max_len);
>                  }
>
>                  break;
>              }
>              /* TODO: BD support, fall through for now */
> +            fallthrough;

ACK. For a moment I was wondering if this was something new to gcc,
but I guess it's just a macro you made O:-)

Acked-by: John Snow <jsnow@redhat.com>

>
>          /* Generic disk structures */
>          case 0x80: /* TODO: AACS volume identifier */
>          case 0x81: /* TODO: AACS media serial number */
>          case 0x82: /* TODO: AACS media identifier */
>          case 0x83: /* TODO: AACS media key block */
>          case 0x90: /* TODO: List of recognized format layers */
>          case 0xc0: /* TODO: Write protection status */
>          default:
>              ide_atapi_cmd_error(s, ILLEGAL_REQUEST,
>                                  ASC_INV_FIELD_IN_CMD_PACKET);
>              break;
>      }
>  }
> --
> 2.39.2
>

