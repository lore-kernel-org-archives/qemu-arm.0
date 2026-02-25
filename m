Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B830FD3758
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 13:45:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvFCR-000755-S1; Wed, 25 Feb 2026 08:45:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vvFCQ-000728-3o
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 08:45:10 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vvFCO-00041w-Jo
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 08:45:09 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b8869cd7bb1so1098634566b.1
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 05:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772027107; x=1772631907; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iz+SN0OKzJlJssj66gNeJbnj9cbjEBwy9OiSf8ygE5c=;
 b=MzivGYAmz2jWdhdZjJuWCCF3uEyvTK8g9vJssQBwcJOSjlcp5eBPgZsPDgnLHzCPtH
 e1VwlMvxsRxlKv1T+4JBLhGBdn9IxNa1/JFtqDynjS8PCTWkK0gBvozjghSm/1IMLn5s
 b4tx+INkFS7Z98K77IB88P5GZKVTM7pkQSrOwoHxCDdU1Y96KdyTdJpXwi4tc7OG7WEz
 qE+U4aLJ8j0FmW/RsLg2QoH8y4Oh3doc+MrBrqbZcEToHUP52FcUcErIo2M0y4kezVhf
 ryTFkPs8YgvQlOBO91E24yDMDFzg1rdGJ4rbCTWXcHjl2+2Iz89uSqD3wenA/a7VaCxF
 jUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772027107; x=1772631907;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iz+SN0OKzJlJssj66gNeJbnj9cbjEBwy9OiSf8ygE5c=;
 b=jDc0LPL4Jk70K6kdiEj9jxwQAHLvt4jgvfRGUlGM6NOGKdjUbyXH2bf1HiqWr4Cl6K
 BUFMfblXqxYH+7wOorwzzGQBQLOz1F1THqhl9uFfjTMvIhT/wmUfjytFfU+IPGvF4Twg
 ck05b0ZcfDU72DGQThncJKx5UsjtAks8UiBu+dw4QC0zM1TrbdIoM0otK3UVQnAgeDfE
 wZyJPTkMZVdTi4h3I/97VVhCz9LHbu7JOciLmKHwnUv0OdWIUomUXjiTNq+1bVg7d9WX
 Sir0nSxT/EOXuAfnRWuB3RK/1pXZ2m+sy7aYrBhbCBOtFiw0lXiiix25TT3fXUIpyTJv
 Sbxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7/UjjQia0zYqt6Bw6l64aktNWmyinYfSJ5BMEzW1+IZHJliLMuZQnq3aUw5py+ND9+fkFwOMYCw==@nongnu.org
X-Gm-Message-State: AOJu0YxyXpO1FuV2qoFs9F3yAj2h2qsibgoFxDaT+po71gIFYT+3jX6+
 rfsVWMg5eecFmZST29LsOBPtco9L3rWnL2CY+GK8VNn1Twalf1NX6yU4
X-Gm-Gg: ATEYQzyq/fM9bVhJOpXxPnTzVHrU9qm2cdMTnDuKqcZFWljwAfLDWPn/MDPBWLxmczp
 CxQt8GMDuEWk9TSb0dmqOPTvgT3CEwZXHfCkzuOwP3K3TqVCkScgbPWwGg9LuTM1J6jhi42OK/S
 YgyxKhBLNSboHORPzsFcSh2potWy0Zaj95srCQjZymqESf8/0Zgv/Qzv4foZ3K46iXreLnMdaG/
 1bQxFtl8RICQ/HZo+G3ieoXOZHURQPiJi0tl7c09qxaGbFgMPz4WoytZNmlumsgTkozNEfcFJAk
 qtkP9RubmKz9/qUoKJEFssyBb44zm7lCORBPHXmNz1qlPmlEcfxzJHbQrQd/PHohHYN38+fny1a
 vqbYKk9TevZFI9pxDl8msF+fubfeW0V53k+c68fiFIKd3iLsa75g6P59Ztryjp5UPuz9XfPnQYr
 t8py1MN3ZupJ1G4wBPLLy1GCYFhC107A==
X-Received: by 2002:a17:906:f590:b0:b87:225f:2e74 with SMTP id
 a640c23a62f3a-b93514db737mr20345966b.14.1772027106500; 
 Wed, 25 Feb 2026 05:45:06 -0800 (PST)
Received: from ehlo.thunderbird.net ([90.187.110.129])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9084c60b9dsm527787766b.4.2026.02.25.05.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 05:45:05 -0800 (PST)
Date: Wed, 25 Feb 2026 11:45:20 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cameron Esfahani <dirty@apple.com>, 
 qemu-arm@nongnu.org, Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Wei Liu <wei.liu@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_16/16=5D_whpx=3A_i386=3A_saving/restori?=
 =?US-ASCII?Q?ng_less_state_for_WHPX=5FLEVEL=5FFAST=5FRUNTIME=5FSTATE?=
In-Reply-To: <20260222180241.14621-17-mohamed@unpredictable.fr>
References: <20260222180241.14621-1-mohamed@unpredictable.fr>
 <20260222180241.14621-17-mohamed@unpredictable.fr>
Message-ID: <6966551B-B54D-43E5-BF2A-0A1D812581A7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



Am 22=2E Februar 2026 18:02:40 UTC schrieb Mohamed Mediouni <mohamed@unpre=
dictable=2Efr>:
>Optimise vmexits by save/restoring less state in those cases instead of t=
he full state=2E
>
>Signed-off-by: Mohamed Mediouni <mohamed@unpredictable=2Efr>
>Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

=2E=2E=2E and:

Tested-by: Bernhard Beschow <shentey@gmail=2Ecom>

