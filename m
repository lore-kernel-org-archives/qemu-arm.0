Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1151665ejt;
        Mon, 27 Nov 2023 07:28:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkQl0EwBP2StAIxVKCYC6DngQIkTc6UtcNG+3AZAYz0QV/G2QVlMfYxRazl3A+dT7xSxvF
X-Received: by 2002:a05:620a:3954:b0:773:aa77:91d5 with SMTP id qs20-20020a05620a395400b00773aa7791d5mr22228261qkn.33.1701098917340;
        Mon, 27 Nov 2023 07:28:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701098917; cv=none;
        d=google.com; s=arc-20160816;
        b=zRJ2chlUyyu0Tyy6sDWaH2gdZAFbn1UM6zJECNqu1Rmu0EjJSfVWQAJ4x43eI0DF17
         GczSCgo85pKNOdDyMs0keYywpukK5UnbtkUQlQ0GQhuA+H7TGw67N/LXyM2ZELcv2ACn
         ZAGASL9lQl2tIeh+I9xeOG3RtkXjKRe8FrOMkFU1mdf5vrsXrY6fZ3xf8fctaHVHRxNh
         euxVW0Nr9R9JkIklLDJH2PHh5SfOMKTdKyXufJX1POOrlCMD2rknpW3NFNu0dUuuONW6
         mpySruKh+JVXPmsZPVlbIoQqzfTKWf8rDhF5a30AMXieezCjLkRdpYFkqkO+lAFRq+g/
         1Ehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=NTiLm7FDOYgVyvB+1MRn5MRXQ5p38RB29/sXJrRP5t8=;
        fh=HXY0anWwRc5lFbFmbTyLIp+NZT61wARIoJcVaUYT18U=;
        b=bIiFjf/TJYtMoN+4DDukzyw1qJApDiyuWZTxfxkoFCJOhj+Ug/kET4HHXKtY9S4KjG
         tydoYQVY5/ormiZKAs6wurj2qQKmtvDsKR3I9vUex6W/WMpzZa2nMm9yED1ne/YW8y/B
         btWVRjpVxS+94jIGV21Y95Y1ru7dzxuH795skspVkPdHZlhxuiah84uCfE9epgpmO0z8
         A5kd7hRf46QeXeHLNCFeoTH0cbbWz9Dp/zcWQBl9GgQkUBVGfm8Exz5pUzGyr849hJZt
         mpZU/AmRIqT3MDSEyYtGW21iI/0YSYr+FbLh9CVo/be4nRkN6YoH5w70g5iTTEE9GDA9
         bGlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ezxSa4XA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7-20020a056122022700b0049d6bd9c98dsi2619681vko.293.2023.11.27.07.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Nov 2023 07:28:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ezxSa4XA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7dXC-0004yk-Ns; Mon, 27 Nov 2023 10:28:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r7dX8-0004xT-N9
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 10:28:26 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r7dX7-00034Q-7F
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 10:28:26 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-54b532b261bso1804200a12.1
 for <qemu-arm@nongnu.org>; Mon, 27 Nov 2023 07:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701098904; x=1701703704; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NTiLm7FDOYgVyvB+1MRn5MRXQ5p38RB29/sXJrRP5t8=;
 b=ezxSa4XAxhrOv/2mNEXteTb5Z5C9LNWDa0x2xSsGo2qUO6In+MNlOXv5Vb62K6Ix7I
 B753DY/4L9x7zz86FxTqEhFzlb4hrM9d8L8nx4hKSQvx5r0Tl/3TaAwNqq6IL116X3oT
 D18JnltiPyoPs2ztSn7iNE0TItPFmUxAgsOWM7eH8ULgayIFqgbWrVtQFzW4q72jHBXx
 VnuJzzovtA1D3kDDD4TaVId01Z1uzrL6S73RB9DR06iZc6thtBLEY2CLo63gbDci+MfD
 NzapSxFZ5eskHyzEmZHiouZm3MURkGhchxEtDhSwhhheSqhciRJnFuT856flSwKZPR0x
 yZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701098904; x=1701703704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NTiLm7FDOYgVyvB+1MRn5MRXQ5p38RB29/sXJrRP5t8=;
 b=Mv06Ol+Ey9gD7S0aG5keXlwfNzCZ/lJHRUpc3Li4FCIzwzH2oEHKNSv3QjldsRfKgY
 raoqcxK8pgJxclzhnq0X6vmMGVOgtO/AuZVl6IBv+EAP/cYZkwRbsqQvaEWHMBq4xL9K
 l9/znyiaK+iKhnQLN7vNL4bQG9oHb7GZ0mZPaRs+ARfQp71qO13J3ONURGi//tISs8bU
 tYgLK6kySNV9422pYX4RwOk0eaQZ4iUetXhNq7r4Pk2ilBnqLdbesZWFbbopsA1CqObb
 J5wbp5XNant8Yv/mu1J48EB7q+fCsVMMZ/WJGpkWdSoWYFnt2DZFAVkrgWIASxMsstV6
 5GBA==
X-Gm-Message-State: AOJu0YzELUvDAVsjXMMeGnJZxJQPZKzUYe38u1cW5nk540V9Og53CgPm
 ANco3t99SJZnaTSKIoFYEAZWYtx4msKgvyvk7WtSsQ==
X-Received: by 2002:a50:8e42:0:b0:543:bd27:f4a9 with SMTP id
 2-20020a508e42000000b00543bd27f4a9mr8963153edx.12.1701098903837; Mon, 27 Nov
 2023 07:28:23 -0800 (PST)
MIME-Version: 1.0
References: <20231121174051.63038-1-philmd@linaro.org>
In-Reply-To: <20231121174051.63038-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Nov 2023 15:28:12 +0000
Message-ID: <CAFEAcA8qz=785qBAxwaDmyPkWbMbiYA=vzSS1Lnf8jvRgxBktQ@mail.gmail.com>
Subject: Re: [PATCH-for-8.2 0/6] hw: Free DEFINE_PROP_ARRAY()'s arrays in
 instance_finalize()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: J9P6GUXkKpdw

On Tue, 21 Nov 2023 at 17:40, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> In few places we forget to free the array allocated by the
> DEFINE_PROP_ARRAY() macro handlers. Fix that.
>
> Philippe Mathieu-Daud=C3=A9 (6):
>   hw/virtio: Add VirtioPCIDeviceTypeInfo::instance_finalize field
>   hw/virtio: Free VirtIOIOMMUPCI::vdev.reserved_regions[] on finalize()
>   hw/misc/mps2-scc: Free MPS2SCC::oscclk[] array on finalize()
>   hw/nvram/xlnx-efuse: Free XlnxEFuse::ro_bits[] array on finalize()
>   hw/nvram/xlnx-efuse-ctrl: Free XlnxVersalEFuseCtrl[] "pg0-lock" array
>   hw/input/stellaris_gamepad: Free StellarisGamepad::keycodes[] array

Applied to target-arm.next, thanks.

-- PMM
