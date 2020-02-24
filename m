Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp599450lfg;
        Mon, 24 Feb 2020 09:48:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqw+3nX9S+7E4kJHj3L82uBKO+jo7CirK2rhCM4BY7K5h4vO1fVmnY3+8Ai7XrJuPNuav1cy
X-Received: by 2002:a37:7182:: with SMTP id m124mr51445236qkc.477.1582566516457;
        Mon, 24 Feb 2020 09:48:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582566516; cv=none;
        d=google.com; s=arc-20160816;
        b=BgA4FH2ncZZwWC8EWCqaEEByzGyzdjOcnii0EEoDzn6w+5mxm7cWzzq8RuDAn2q58F
         27nxlWOWFBWubGviOMOL0+Fb0WgcLA1X2xUw6m7YFgMFaPt8mD1WjXJCSGpzQNMp+PKS
         tqHo7mgJ8Ni6uEQ3GH/JBPruBKWstAGSpI6Y+nu1tXOcIVmmvpbNCoUUNwnpS7unMpO2
         XnI0ebtPQdWTEG0L+um7p7W1r0D305gThIXkXvQ4xLtkl24iSJVFIReXHXdXgm+hIl9I
         DhcX96b18T0Y14zZQ9ue59wF5bByVG/EpgYL4kNmH+DDTVsqhhUoPZXLza/oK4iZnAjh
         12bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HEo8Owo3dxAt8duIBP68fE93UzuHq/vpdKVFc2vfq40=;
        b=OBqHGWu5EFDFlzKFI5l6xOI8TvPlKhNcIRsByr8NPzS6juNIo0nIYmDRFSuIfuRQRQ
         /gVjEEQmT0bx0iUM2vexVFD5GObiGVBuIsCk0UE557BdCcQpeALG2azlMyx1Bzpa8veG
         7oWRhp2Cd4eSgi8/HGpU1xLAuv1cQK4m3HbC56f+OtNC4cifmfKFQY1/x6iXUWYqbXcB
         laCleM85d8/j+TpqvfPGYOOgef+kI52iVn0EaoAgy2umFrX6cxUM5OIYOfjQIW6Bp2++
         s47kl6J3QL1mQqx8bK93NSHhLia3vKv2s9HbVCwbxjyLKKFOWQNzm789dSoCgLXf3okY
         cR/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ONQAaRHY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17si6429963qtm.150.2020.02.24.09.48.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 09:48:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ONQAaRHY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6HqN-00058y-PW
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 12:48:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53174)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Hq6-00057z-D2
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 12:48:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Hq4-00058g-EN
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 12:48:18 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27720
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Hq4-00058c-BD
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 12:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582566495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HEo8Owo3dxAt8duIBP68fE93UzuHq/vpdKVFc2vfq40=;
 b=ONQAaRHYDU+Ezk314x4cnNhyyxCjUlM5F+J5YdHQv5FxBjhzLeLGpSpniLtIFArHmPJN9c
 9PwzJcTA5xBsOw1Hji3Y7xzqYRZqPD0XHNlv77mDMAmH/ikR5SXp3vNGHR9MPbo/z9OQr+
 K5fn9/I4NDhYhI2jvKGnnu4HLt6u+cY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438--r-ksFKiNIuSG6tZoC_wWQ-1; Mon, 24 Feb 2020 12:48:11 -0500
X-MC-Unique: -r-ksFKiNIuSG6tZoC_wWQ-1
Received: by mail-wr1-f69.google.com with SMTP id o6so5923084wrp.8
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 09:48:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CYthtwoHtlW7P8CCYCmGqIORp+qZPl+s7XsdJtf+IA4=;
 b=HLRzwN5negAKP9UyeGxTFo+7jULK0dy0IiDu4GvJU+wz7X3nXj4/SkLgvVsXs+pzPJ
 cQI9f8ZMPqQmOfVCM+T/R+7XYVS2WlKKwI773Wz6/Vwh/8oDtGv6MdZNhjK/hk37YJQp
 b42CNDKzyWWjolEO6cLb0MhmnjAvBtbpydmY0L0bo/KF7DkQNNV+oAywLTEFn1ffWS9V
 Q/OiS96qBZKU/uJhjE75goLN6qR6AevZ7dKd/4NvHccRZuxgRpmXN2H/9UHrI5t5tVAq
 X8CDz+f8l2SX56SpESUTs3yLQzxpVyIjSRxPslvRwbNM518w3UNtwhqNzF441g9IY05q
 0/mA==
X-Gm-Message-State: APjAAAXjXrJbmF+4IBnCggVMICGm7PEx0HKm6BmiolDRiUdApLyZ3Q7N
 BARwAz1VoiZjOzX5fpA6gbkcxa0ledes1qlTZuyEqfS39njmFATDYPGYuzDzGehwMCsSEntHnJy
 Dl7acRYZ26luw
X-Received: by 2002:adf:ea88:: with SMTP id s8mr67768801wrm.293.1582566490318; 
 Mon, 24 Feb 2020 09:48:10 -0800 (PST)
X-Received: by 2002:adf:ea88:: with SMTP id s8mr67768780wrm.293.1582566490105; 
 Mon, 24 Feb 2020 09:48:10 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id z6sm20307343wrs.96.2020.02.24.09.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 09:48:09 -0800 (PST)
Subject: Re: [PATCH 1/3] target/arm: Fix wrong use of FIELD_EX32 on ID_AA64DFR0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200224172846.13053-1-peter.maydell@linaro.org>
 <20200224172846.13053-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3ce87bfc-a6bc-7d8a-d968-dbb205235e48@redhat.com>
Date: Mon, 24 Feb 2020 18:48:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224172846.13053-2-peter.maydell@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fSbxksSjPuZQ

On 2/24/20 6:28 PM, Peter Maydell wrote:
> We missed an instance of using FIELD_EX32 on a 64-bit ID
> register, in isar_feature_aa64_pmu_8_4(). Fix it.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 65171cb30ee..b647d8df916 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3723,8 +3723,8 @@ static inline bool isar_feature_aa64_pmu_8_1(const =
ARMISARegisters *id)
>  =20
>   static inline bool isar_feature_aa64_pmu_8_4(const ARMISARegisters *id)
>   {
> -    return FIELD_EX32(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >=3D 5 &&
> -        FIELD_EX32(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) !=3D 0xf;
> +    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >=3D 5 &&
> +        FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) !=3D 0xf;
>   }
>  =20
>   /*
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

