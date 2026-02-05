Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C473EC1E8B
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 10:17:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnwQj-00026a-Eh; Thu, 05 Feb 2026 05:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnwQi-00022z-8z
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 05:17:44 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnwQg-00071G-VS
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 05:17:44 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-794719afcd4so7566977b3.1
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 02:17:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770286662; cv=none;
 d=google.com; s=arc-20240605;
 b=EsCETWZkikOiCwbjljLU52xo5i8Qn6qYvvFKu0EUuzOBWGSxnvJKweaMKhOHPH0usU
 0WtWbr6M+H9cCcuYyjWEZUkh0Ce6KgQDO/s+1IvxTbHfstfpJwZzDrUa//i9zhVYXU7M
 pjNrVoU77ppKZsl0LSVdz+YcJS61ffuJfisMCUIF3+sddYweAkAauAAjAxhw/nN+TVf1
 v0mN09+oDl9+vtbHaU/RcSoDi9jvRQ+FYL18vwTFicFwC7a4NPXrqkDcw63QfGmHqANE
 tmcN4wKm7CLQucfJFxl98hSS1BJ3TXNDw6xw7iUIvfECh9Mbv7XxFtxj+6e2u0nzz2dd
 Evug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NwqyLTejgGUQwqWC9rLC0neXY1L1LQEfYlBSKMGnQbY=;
 fh=RF4dhFQmJWEHm9Kh/ZuU/4AXDCdqiKYYPqZsKp7AkY0=;
 b=S2aM2MqzuL/xbMy68Ibsz6SfcY+mLSPzTSfonpwpbNhJar40zIhgT38dbJ5l9lPSZM
 kAPjgblLjYkyKfGVLUd1mnNrAb4QINPAE6A0fuP2TDpP7uk7ihITN8OJpult3aMN0Rzd
 lbn98Ub/QNlPRVivl+cHjB8+/Boa6QwtjrNoUj6CTihpuPLUim2ZJhSnLvjJyGkbsjNQ
 fRTrLWpuAGLvpDmCSVA5jI3HNK3yywVz4qX0bkqIY1ib2yVKgudyeZiXN/8WsKE6npFo
 HgoXtyetAn3LdTvqXSVy6KiviDqKe3mXp+4JYHcExzblkuXemWSHUdNoZjj7vo/hYeO8
 meJA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770286662; x=1770891462; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NwqyLTejgGUQwqWC9rLC0neXY1L1LQEfYlBSKMGnQbY=;
 b=kjfeTtSzddP1Oszrz4NPqhU3eLI0JKW5zsemeE+z27PEAZb3dS7a9j1FIf1EFnKvJX
 egrf73guH6d2tTfQP5FtXRbbcSPpoixJpP/GA+xNcwslEBEIHr48Lpr+xcVnnC5mxCO3
 Hhz1kXTFWoddrp/5P7cV//BY8x1cFcCiDrBygifAB9lb0JUDwCBhEQafICP4piWEryOM
 3lUS4yVWVuRElE+vi6aP9rSXTSsbrpFhPT5a6NX1eY7K4ZffcQpI+Gvz7fhencs0Xbv/
 GayZT/pmvmBRDmRHoO2s0IX41cq67YR5+wkvkbtIA7J2VqBWS3W9eJrdUzDuUOq+ceGc
 edtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770286662; x=1770891462;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NwqyLTejgGUQwqWC9rLC0neXY1L1LQEfYlBSKMGnQbY=;
 b=Cv+dX9jYCgqxqujphuWAae0uV1mC2jUl5gB4u7TESCT+Rx8g5L64MdK7B3D6WtxsW9
 6aWlXyZh9yaCXSayIt14JJG0lUk940NrTxbksTgz+OhH/3vUlTMSGxe7LRD2RgLYw4fo
 7dXqgMjepXpTzvtrJzVq2b54ZoSXeNTnjUfPtLXlZnL4FKK/zmIQ8QXO289IxCvu3FEu
 GA/1Npcle1krXg545cHPGk+Q9QS8WvUTy0jGtRid/ibzxWZJazb5VTR932/qDB0GiRz8
 /t0ycacYJyfApUR8NCnx49NxxY71Z0wI0Ffo0LapMud1HbZEqxeSHed3EHYX0k1zcWG9
 oWJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoITOyn6EWr0ZFtPo1vhKMtRabWgt+CHeT9iKU6CEaanEThas8LwsBmAytanCdWUZBzlhPs9w9Kg==@nongnu.org
X-Gm-Message-State: AOJu0YxIO76WxT9/H65zwYBftX8y9MicLaikwnC9xHEd9Tvtw3JTG5wl
 3d9zIBvjByRzSbuDiL/6Fi2YuCt3MZizOn/CWEa1n0YtqWKkHt+cYk/1/CJq0KHDRlI1P/AN+aa
 MR+KqIzzLC85yaXJ8walDBX8O+4D5GYpCgc9u903RCg==
X-Gm-Gg: AZuq6aIultvaxsqLuisHVElf343KIwPG4n6WZAtFyTjxctV53gFz2dpypzFbDRSY80Y
 i/ygS6+oOmOxOdVRSZmuiT49e+TcE4KGDqlRtsZe7tUh5l/hyvMCZzXS7pUQW3VOsdxe1BKUmWy
 R7Ip/jfK/DnlDQKLHoaVk67wseW2g6hitISDF1h8jUb7ZqmIEjWFBDpWQFUaCfW7krhcGtFPZYN
 qrJTUKy88bJ3njhJdFu7p4ZOl3dg/+qaTvA2hcMfYQF4cYSZ2graYOqVQNca18zrmMsBw==
X-Received: by 2002:a05:690c:289:b0:795:e10:3c9c with SMTP id
 00721157ae682-7950e104ca6mr33143217b3.29.1770286661823; Thu, 05 Feb 2026
 02:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20260129192009.14707-1-mohamed@unpredictable.fr>
 <20260129192009.14707-8-mohamed@unpredictable.fr>
In-Reply-To: <20260129192009.14707-8-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Feb 2026 10:17:30 +0000
X-Gm-Features: AZwV_QigkqPVo0n6PvcWC7mgVXFYBB9hP5GqRFZnSJ54x9ktmIJHHLWpVDx4VcU
Message-ID: <CAFEAcA8vQNvLUP72HE6Prak+AaZJPq_jf+Nd0Y6rXrGRSDYB7w@mail.gmail.com>
Subject: Re: [PATCH v19 07/22] docs: arm: update virt machine model description
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Cameron Esfahani <dirty@apple.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 29 Jan 2026 at 19:20, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Update the documentation to match current QEMU.
>
> Remove the mention of pre-2.7 machine models as those aren't provided
> anymore.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

