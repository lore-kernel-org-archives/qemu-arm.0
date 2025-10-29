Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7236DCCF9E9
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 14:01:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE6k5-0006dM-Ge; Wed, 29 Oct 2025 10:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6k1-0006bx-4c
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 10:01:33 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6jl-0005W2-FJ
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 10:01:32 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so48282955e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 07:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761746470; x=1762351270; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QEhR6M0s41+/Hqzw01UANwG0jYSvvs8GWwB6rih1zEc=;
 b=arsVyIDiHMaw1OEfy+xvSEcTSPoWUaSmu2R0INLzMYJEdoJOVamgD9yaydMZowL0tW
 n+l4L48gv5UG5Zbla5XcpDnl2/uxSASq2C6bTF00wpmyqmptXjLhqy+eJrx+9TMueYbe
 KTHJXezS52SfOwiE7F/nDpxH9VbV7USB38qsKEaqT4kNpr5mH/wk2wUAQL8p4fO2Kdv5
 7K600n7nk027wL8JlYfttEOsAm2lT1ZME95N36Pde5oqk215t1f0goLv8ULt0AuTMwJt
 WIwt9Gg+BztvXDveGEbCOKgKc0JRlAx1VSRFx9zQji95XSK4F7y7kiX8eQlU6/LcGfSg
 rG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761746470; x=1762351270;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QEhR6M0s41+/Hqzw01UANwG0jYSvvs8GWwB6rih1zEc=;
 b=uBEbGi2RXo9OVhLpkRR4dCfUU8FqrNSUHEWUQ+EQ013YBglUxAsKYUtk/d6XMHuRZW
 H1TLjQzcT2ZWEmQ0KK3Z0S5mViE1usYcYOxeBHjXzRO5patTZdLaUXBNU3U0M8sNQVPj
 438CKDTciIGnHmPJpDU12ccp53eO6U1OnVkt1BdLeQROdlv6mEIj+63bXikDjw3sxY87
 HokXTiA7NXlLyAZwP1rBJWWUSTj/2MFb9t7k1MkagpX5zFUfSrBbnNAhdxNggcK+F014
 MrcRQ7yFU7V8joNEW9XOeEu2mSMRJthlNi7Tgu7bFunGHB7U5mY9qsRYVZRARBEfpdz+
 HBUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZuTgsD3DMN8ffWIMMp3aVnUkHOmIU39f75G2oD+iobA6qNO+XkuvnFBgh6fzgS2dd4S/SRfIv/Q==@nongnu.org
X-Gm-Message-State: AOJu0YyD4ux4OmOzZiZC+jMTze2lmxk9wpd1RuAWeRa6CjPnaZB5cRiL
 QK/42YOLM+WX/vJrOH+vgNao+JQbw5iEHqB5DLwbrOLcySRoewnPoy/OlOYjD0ID3b0=
X-Gm-Gg: ASbGnct908INZhbbR+Wzr1b+G7ZqejFHcLsunuxj9gRtakgmZlDFGYo0z6V4PMo81ro
 3n9MsINA/Px0G9BWxOQxNJWlCTm+i0UUq4YzHt2smWJRygRiPB8X6OONxUKarBO/YYZ6Lc/NJqt
 alfam3DEiYAvsobPzaZywFZ0RK97JuLyAKOHOhI+rI91E4DA6wzmkwebKgHZLBO6S+oPE6nwRYf
 3pkE2Pu2XdVn8ScrjqSUBVMnh/qHq9oewpTFCo4RbX/q5XJoZY3ZYpQeF9XsRm3DyNkT8038ZpJ
 j31/x3ettHuubyKX/hJ1F8yEcmm3d7mg3D1weIo7KRJ56RtexBrdd76ZK3Qk9AKNg/tKd191koY
 dP10lLYN5WgIGCANwcLMOUT43zpA34isfc3sM0tn3LkKdkCMoCNSMXrgtj8eVpPflKiQuhumAlj
 0jdFLGxDJkVsmyeoSOFfnCHpejnZp1BUYwRV+xYtgDrQcckl/DfT2v5A==
X-Google-Smtp-Source: AGHT+IEm1B/B8M5sogNSxjNyogOJwHhjpWeG0zC/QBmPglhJoxtpWgJ5QXNgvKTq78lghe9EA/B0lg==
X-Received: by 2002:a05:600c:4683:b0:475:dd87:fa32 with SMTP id
 5b1f17b1804b1-4771e1659f8mr27433415e9.1.1761746469550; 
 Wed, 29 Oct 2025 07:01:09 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e27f7b8sm52089295e9.0.2025.10.29.07.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 07:01:08 -0700 (PDT)
Message-ID: <92e2aa49-d55b-4ea2-aab1-fe802a787bca@linaro.org>
Date: Wed, 29 Oct 2025 15:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/35] hw/audio: look up the default bus from the
 device class
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Alexandre Ratchov <alex@caoua.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Thomas Huth <huth@tuxfamily.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-ppc@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Zhao Liu <zhao1.liu@intel.com>, =?UTF-8?Q?Volker_R=C3=BCmelin?=
 <vr_qemu@t-online.de>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <laurent@vivier.eu>
References: <20251027151045.2863176-1-marcandre.lureau@redhat.com>
 <20251027151045.2863176-3-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 27/10/25 16:10, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Generalize and simplify the device model creation.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/audio/soundhw.c | 20 ++++----------------
>   1 file changed, 4 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


