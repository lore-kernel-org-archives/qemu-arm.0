Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9462C61DD6
	for <qemu-arm@archiver.kernel.org>; Fri,  4 Sep 2026 10:29:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2RAG-0005Qq-80; Fri, 04 Sep 2026 06:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x2RAB-0005Q3-Gb
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 06:28:51 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x2RAA-0001u4-3h
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 06:28:51 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-861feb6d61bso8933797b3.2
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 03:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788517729; cv=none;
 d=google.com; s=arc-20260327;
 b=TNAxbbH7PeLo8MBiuE/EQ+7DQsx41FqPom75fCJ4D2AkD3X/Ilsx5moS6Kgpqy55nZ
 rHsu9ObKOlCsuiotBNz2oYrvqta45VMN2KVuEaGIz4DRuibEMo/fe1hf7MV89bnkkv2O
 +ePmOKpFcFc+mxVKIGVqG2bBp25JY6JuTDJd0uudNxJBwWYKrV6qzv0AY7gIAvZn2NdT
 sVjoxKzQkPwdJ7UpngD/gkz6Ust++1vKm/Y+0aFuRUYZD8OqmIYANxozfHT+F6xPJtMC
 OgOZjnjiUvki9JRY9QW0l6MWGtIgnbyYWlVm9iTrKXJnZZ10AY8qgSgMz2nYoPQAe5fl
 0qiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=NpbUMnUwHgVozA/7FwKC6hv4uFWsxS+jujSUd5/ud9g=;
 fh=v+msT6BzWvtP//fZJXfxH8jkmvBKyZ4AJX/UkRhk3AM=;
 b=qBx5wXTqapyZZp2GcmfAq3hB3yMv03lOnMpsvEEfh/ShCCTJqHImoAstIndRhjj0ZF
 Gpd47bWzkjMdFhsaOdJhck9QQUeau230t0MtTyS13q5fWMLMnV/cB9SIP89jt2usr3O0
 1gIK47rpoVrqqOR95COKO36jHkk5iZnng983fnVlZ5+AQLZUbex63XF+rsxgotn60gua
 fVv61DeHOtSAoPAKfJgY2V/CBbmB/UwmB6fp5EKU6r86WfcPz/Ui0S1bgYk1eBiuIQVM
 eqY5kZZ/ZrNrrIK0or3RpC81dzAFRYAt0keXCnYFqbkzr4yj4TRS5Q1SJbt00IqMAAqt
 r0Kg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788517729; x=1789122529; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NpbUMnUwHgVozA/7FwKC6hv4uFWsxS+jujSUd5/ud9g=;
 b=dKdmXvFw3/YVOf8KQXPgkdEuuIssqjBZ2ESOU8S38xDcrVhtMbJVLK1bgksJUslpi9
 +JiW6pRnZO+7Fa9WtpsCRJrI5K+mdO1QXHwhs7TK+lFDz9dbzSxgyq17tRA3tL9EI6Y6
 s0gQbBrnezImeESkivBHJg60xtolkSpzZt4i3iAn9bpXELC/rounrj7SKe+GtX06pFLp
 mEjDu399NHoDMYJr9CVEAhYfesV3xZbWt87sdE+ZYbjV4oJWzHPJ+eS2BzNbDtKt5rDJ
 CiwJ58ZhjUQldrfkCD40Kvtgf1imcmK0mMOrj+ej8ndlgV+I4WOPb3b30MasqfaaF7Ou
 CUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788517729; x=1789122529;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NpbUMnUwHgVozA/7FwKC6hv4uFWsxS+jujSUd5/ud9g=;
 b=Tk/joYrYYOvUsF+4OVyBv7A9Ve8UjtxTACWvjKskkDldx+7Q2paA/QSfHdD5vGYRm9
 4T5jno00j/hFcDVozms3/BMmpQZNrZPPeB79/ttkkakfw4WUEpFthI0XtNlYvb0hQ5Ru
 4Y52C6zhxS5opBdUlR/nLt4U8GGU2B4DW8lvbw3SlPvCgxE4IDuAzzH+toSAIDRHRB1I
 CGg1oJ8ZPp7wOKIzdiW0eXB1a0Vm/YnUe9PDIiMrnyaR3ninxBTHDG68GGPxXpyLDZGB
 gVcrjHa83ZEjdLMBf8xTScVtlBYbaCicGOtDKY9apXPzlIAB2oYwoZNFcC9FXpClxfmE
 lHAw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw1NOVo/ePBFMG8VTOHOQrm+L8VuBGsSLQWKoXS84I3wrGoquuolrNwk9/K9uZ4EsA68+mJwOHzjQ==@nongnu.org
X-Gm-Message-State: AFuF++nqgqsEWXnJ+QEs5A8t2F7B8msdsz0ze4O+JR54Z9BWF+6eT78r
 Xj2nwX60jmCLgzqqDurjNFmZTM44ulgyKlpMGqTxI6DrAsNMxgTqQEblmtduR8Q4XMSCqdJx02l
 eNOLoBU6nmVZ86Q2UI2b5+NBtjjmZVOTpBmnbWNRABw==
X-Gm-Gg: AYBFou1uE4HuCm6DQR7w96NiXSeNWlwbdBTZHsfE2M1ICC6lIEXTnykTk3rG5LFY3k/
 ojcRkVDJ6xhMygburDjnk7hLzNAe1xIMj/JuohGkNE1+SXNMqZGXR9S1bt0sOUbXvPG6G593oZe
 bGAvnBtO+4GRP/PeovRNZnMwgvPE5w0URaplGLwuDP0gAW+EQkzwEF/kLmRlZ79NyXQRMC5/smv
 cRZvUSeFm0hkifTwB3k+oHChU+lYjz8VF1nQ6+ixM1NWo6NLlPUZibH+vzlsGaLLXL8yIw02Rd5
 GKFGW2s+1f4yRiXuzw2OoCS4xUDbb50OH47PGgxFX+iAoYfqzAoRdLLniqJ7c9+zgVUJcsDUC5X
 5TQF9uIJ2AH8JGNJ48a63o0azu914s7LqO3nwyfc=
X-Received: by 2002:a05:690c:a694:b0:80b:9f4e:a70 with SMTP id
 00721157ae682-8712a70a30cmr20874697b3.26.1788517728626; Fri, 04 Sep 2026
 03:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260903112532.3276678-1-bin.meng@processmission.com>
 <20260903112532.3276678-3-bin.meng@processmission.com>
 <0795176d-4580-4acc-a3cf-c40f8d221661@oss.qualcomm.com>
 <CAEUhbmW4h_-az5iBsztzy8Yuu06+WMjOYcrL51sW8VEgyAaSMw@mail.gmail.com>
 <881be57e-5496-41f2-af0b-e21087fa5e54@oss.qualcomm.com>
 <apqcmqpJEEyc7wGx@redhat.com>
In-Reply-To: <apqcmqpJEEyc7wGx@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Sep 2026 11:28:35 +0100
X-Gm-Features: AcwNN1W9qk7UPSTgEUrQUtXxxxKm9hfqcwaYXW1xfcUSyLy6sGj0JEn2tqpuhm4
Message-ID: <CAFEAcA-s+zsChqxYa258GOXdjniusdYeOCzGd6OiHWBQZV1Syg@mail.gmail.com>
Subject: Re: [PATCH 02/33] hw/arm: Add basic Phytium Pi machine
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Bin Meng <bin.meng@processmission.com>, 
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, 
 Yonggang Luo <luoyonggang@gmail.com>, Anton Johansson <anjo@rev.ng>
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

On Fri, 4 Sept 2026 at 11:25, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> We need to use QAPI MachineInfo / MachineClass to report to mgmt apps
> whether a machine is capable of using hardware acceleration or not in
> response to "query-machines".
>
> Currently if a target supports HW accel, then apps assume that all
> machines in that target can use acceleration. This was a convenient
> short cut assumption, but this new machine suggests we can no make
> do with that assumption, and need to explicitly report it per-machine.

That assumption has never been true for Arm; this new machine
type is no different to any of our existing boards in that regard.
Support for KVM etc is only present for the 'virt' machine type and
one or two others. Most of the rest don't work with KVM because they
create a specific CPU type (not 'host' or 'max') and that won't work
with KVM, or (as with sbsa-ref) because they want EL3 support and
KVM doesn't provide that.

I suspect it's probably not a valid assumption for non-x86
architectures more generally.

thanks
-- PMM

