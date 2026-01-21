Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E5FC44501
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 09:28:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viUV8-0002sJ-De; Wed, 21 Jan 2026 04:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viUV1-0002kF-Cy
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 04:27:41 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viUUy-0007Ji-WE
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 04:27:38 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-7927541abfaso61257117b3.3
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 01:27:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768987655; cv=none;
 d=google.com; s=arc-20240605;
 b=P67yhQOr9jciRhFZgcNJGNh+g2tK+itP8KmRo0cb+uyW8WFAAR+4PC3/NDUrrLC8xu
 iC0xviR8PJ8mhrD5PKEaWdHlqI04hkNFKZ0/sqo7w5Ynkm9q5uU8y9MxwSqj/4kRBF1z
 s7+2NuJPx0t9eC4fcOQXcFt6LIYJqooAv5Z+v0ANK6atKsbVdtUAzQo/HAV/DDO3Hfww
 t0f1XYPfa4f3ybVZWiQook5MGM++wiVzq/9XgINSIJDBfcYP2iJfVmsjPUHukzS62Wje
 X9I3NsgZKPVKSEto4+AP6tNwszK8udQds1E/JzDbmgg32WXQyJ0RH+vuuQIqHDwW8/EC
 /4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OiRDwoLtTsknQ7PacWzNbXiZ/sHl5VJBOJ2/kVClTqw=;
 fh=0jkPpcpDrGLHWl7C0KGYOwYoioHl+QotMUhC329cUjk=;
 b=cyD5nR6Iprw8XkIEDlSUxWo0cpN5NjQFStQfBfxFQDVqu8iCoYG1yn8nyZGo+aKfx9
 cqnBlb9lyWTYu0t9o0eWp5xbew7q40bodJRTbFtIT8esK79BtGUfJQlGhXQ2o9jTCXQb
 gZo9GZ1OZ3Taai4lwL41aR2w1C1Wy1KyVXEYyKUG7q/AYP+R0vghmzZvOBp1XlLqOPs2
 8p+sYjpYpuZua+WlZyzGiALV5LlIz9BNjN6acletaZ2htSJSj6rX0tku7gQYomQ+CfCI
 TSYMjUT2f3o9IaP2k/b2urg/Ygciy2bVDW/q/70U0NEYFQ/nzZEMuzUJkmKHRpdi/1sC
 AmSA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768987655; x=1769592455; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OiRDwoLtTsknQ7PacWzNbXiZ/sHl5VJBOJ2/kVClTqw=;
 b=pEYWHr5tKQxpDDnP+P7hpgbTRJK3WegyKYlsQPVekY7oX6Y+X/WcX14x0CXnlCoNcg
 p5B88R/Ze4cJPWdcQ/gXDHL/82zhhXcrlG1kLbjsg/EyzMVLoFswSbqd/ZsQtArNIic2
 S1vnOBlIJP9xFXhqlcd57WUM1d6fBTM3wLmOCfU0wQTzb7ueMjqcA2ZG1LwLffbLp+4z
 HAitn6rbUM/Gq+b6oFt3HRvhKdjqkPsns6WJ8BOsdcTCAaKzxmsuwOZuVL1yNV7c1Wzs
 msz8651ApWDxCWGyxvgt+NOQERoyvHXcUpP4jNwKJHDzx7w58p1UXtZgslNK+GQk7MpU
 Bg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768987655; x=1769592455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OiRDwoLtTsknQ7PacWzNbXiZ/sHl5VJBOJ2/kVClTqw=;
 b=h4N5srAG9aO14ViZblMlRZJ72DhEA60LJOWWULEilLQU1lxt16CymJG/GsphUmkPqx
 L59cicJJV3OHjEjqOWOyXQcGppHPWDK1uAbvZhoKndyE6H8qa1SlmWvzU15sqeNq7VxY
 TQV4SJkrYsAe2ejYscSMonYNa1OfCCzT0m7pM5me+ThHZzq8Ex/M9JWwP01959CyyRK5
 LsSPpRs+SiL7aJlOI3KL6YqpfWxATXpRvYk+4i475z88I94M6qwu1+qs3ZHwJBvwSWFQ
 3TccfJVGLLqVstsCtuVZYf7R3hBYwgMo0o/bLGKnJpNenWRFAbHEIFIscm+vkF73CEjD
 VVyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0dqvKxZQ2JTflzNPgUVr/Wj3TUfppjDj13U4jH+iBsrP8uLEgkl1m7MzO/Ymp5XYCeGAHXx7Uww==@nongnu.org
X-Gm-Message-State: AOJu0YwVTCG8SYcnWc7QibP/pY9iTdh/d1xOgL4V3jZiUUeTHAJT8WiJ
 qIGvr3gQfHyOj/Owa7QTu5XqsoS4sRXPg6XsBM4ocKhzIRce69ER0raM9mgSsEYHjVqkaH9O6ZZ
 k7px5u0YVWvrmkif7gNyivnrVgU4FwLk5cg7MBDVU3g==
X-Gm-Gg: AZuq6aKVMLRgYsa4cgBw0jPchs0vWU4UqSIBvfSlGza62WBz3pFuV2ShrD97twZo7kg
 DujrzAFWAcS6agt7f8ZKsPrkLKu66j2dRcW2DsUQ2q8TNppBgAD2AzuvB6SbFwSESVzfk2jS57J
 xI1C6Q8w2VG2o1wAXCsgqyIjWNzy0H7jDlAGOEIp3Nns3uUcLNd9PwCkj0395Ti1Z5bX8AbCshj
 wd2cjJIHYqrVPNXVOwLuor+t/dyLw7WOXU9VPY+NRPgKBzxIQWNZtPdXfRuFQOgqXgo1Q==
X-Received: by 2002:a05:690c:10c:b0:78c:5dfe:1b57 with SMTP id
 00721157ae682-7940a245084mr38019387b3.38.1768987655428; Wed, 21 Jan 2026
 01:27:35 -0800 (PST)
MIME-Version: 1.0
References: <20260116135235.38092-1-mohamed@unpredictable.fr>
 <20260116135235.38092-5-mohamed@unpredictable.fr>
 <CAFEAcA-3P6i_w3b7SaFTn4Zmwnot5vpDs89y+zpjcJ=-mEnP5w@mail.gmail.com>
 <8158CEFE-8EA2-40A4-970E-01B30BACC019@unpredictable.fr>
In-Reply-To: <8158CEFE-8EA2-40A4-970E-01B30BACC019@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Jan 2026 09:27:22 +0000
X-Gm-Features: AZwV_QhbV9c8W4eGRYL96WaTovp4ICRNg0iXp8GbxBedwhmIWZiOBQd8zxtw9Wg
Message-ID: <CAFEAcA9JC1HRboZ=722dsT7a4nDQNF_ECjLK+z84T5MJisfppg@mail.gmail.com>
Subject: Re: [PATCH v16 04/26] hw/arm: virt: add GICv2m for the case when ITS
 is not available
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Pedro Barbuda <pbarbuda@microsoft.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 20 Jan 2026 at 18:44, Mohamed Mediouni <mohamed@unpredictable.fr> w=
rote:
>
>
>
> > On 20. Jan 2026, at 19:02, Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
>
> > The MSI controller selection logic is already pretty confusing,
> > and this is making it more complicated. I don't think we should
> > need this machine back compatibility, because currently there
> > is no setup where you can have a GICv3 that doesn't also have
> > either an ITS or no MSI controller.
> >
> Hello,
>
> This was to replicate the =E2=80=9Cno_tcg_its=E2=80=9D where this was don=
e when introducing TCG.
> And for the purpose of VM save/restore on HVF with the older machine type=
 continuing to work as expected.

no_tcg_its is there for backwards compatibility: on older
QEMU versions before we added the TCG ITS, if you said
"-machine virt,gic-version=3D3 -accel tcg" you didn't get an
ITS; we wanted to change the default in new machine versions,
so we needed the back compat switch.

What is the command line that works today and where we
want to go from "default to GICv3 without ITS or v2m"
to "default to GICv3 with v2m" ? I might have missed it
but back last year when I was looking at the current
configs I didn't think we had one.

thanks
-- PMM

