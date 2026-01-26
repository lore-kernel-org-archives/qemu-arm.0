Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EC1D13C20
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 14:31:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkNcT-0006P4-CB; Mon, 26 Jan 2026 09:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkNcM-0006OP-TR
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 09:31:04 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkNcL-0003ZT-Dx
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 09:31:02 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-7947072d0f6so2195727b3.1
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 06:31:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769437860; cv=none;
 d=google.com; s=arc-20240605;
 b=fUs0th5SoaZsB4KBwBzkvRJkINlfC6B/HY3ZD2IhtjTRkyQitELc0EpLlRoiahchzf
 afTMHvJqyPuXg1rlTVQJ9FGmpu3u1X4DnwFZ9mbivKmV7cnkjMJm/n6yNetBv8T1ZVh9
 ahxUvCp/umI2KnlI+6CyuFovBYl8x6EfZsdlMxsiEywpe3Moe0rdIazq6edBlmFd4cTZ
 zxBwZ0VHPL3QJmxTrOFQ7HIzjQGu7NNFRZcaGtujg5xdSkjBt9TfwAbUIZgRQyyfmXT0
 Dr9u0zbV0gUN0KmZjlEvVoIAkjCJWP2hSX+HfFfm+gXOTXslqKXvfPb/Lm2TXoKj7G1t
 Dz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jLkgGTkbtfqp2mGuXLFxgS/Ev8xM5jAQw+MQuglaKTw=;
 fh=P3zg8pzEhxlM9jG2DNTQDHD7LfR+vZABGaynpKRMRDA=;
 b=iah30L0udPk33PGvx/JA21scnVz2D8o+IwcK1LZHN5GJD2Ba6HaNNgVqOthnXohRu5
 Z7sUKJoKQmY2K5uxT2u+217feKf3anyvZndEGCj6BQXuebzOHzLioEOhGa5+lw5nsBpl
 gv8b3pN06kLPh8z8dMmsOQH6UrwiyLVs0GbrcTPswqMU99jQxA4RhHhGzF/srTgWpwBk
 4S26f7MQtU8gYSKrIpWnxWz35ZnLBYMNJDbTbnM+PgVU/Bq7vt59ONhfx7l+y8Tg0kpJ
 XmTnjAEVMWrXEcQHyi+YamgAIRuaWXUkF62NAcm2ASUnjGN7N4hRZ4gH9nrooC58DZ6a
 wRFA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769437860; x=1770042660; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jLkgGTkbtfqp2mGuXLFxgS/Ev8xM5jAQw+MQuglaKTw=;
 b=wLm98vT1Ri9EiPGSSex+DIp7n9yTPd91JOZ6VErMkEPyKG42vB0Ng0XU5pXyHrijER
 zgGddyrwfn4XQ00++mYS2xsb6W1camQ14pEK2SxavAxspylqagOKkuzM1DGupDqItAJf
 fIM5/mAq7pNC5JH17Qn1AuSE/HfuxhlrcPeakVJOc2gsPkT6OxG6TcIs4ZMcb05O5Y/5
 cCFGapcdbNzMpHONOPyj7hlzBuxUgDX/lve4tWdCcGYufsEYtZm6Up2Bxd/aT7hnzKEQ
 pE0iX3/3O3iNUfAnO2VTJz2b0aERNgawVm7bsTWz1QiGw4HNWBXVRq5A0pv73IpRLevo
 Lt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769437860; x=1770042660;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jLkgGTkbtfqp2mGuXLFxgS/Ev8xM5jAQw+MQuglaKTw=;
 b=OTOA4hrbOfp7DGth06QDPbRaghYE+pow10hSGhCFjncihfKDfA+yfEhNLxreEuOaNB
 HeIj/2JdPWp84x7J+HF83S2ZhJDyXorqIr7wj4gC8FRwFRR4qwe3zXLnz7LLnB0TZ5ti
 /P47yJryPfVzpLNHb1N65UgFqvN8cYjMBXvo71UNA3mEPFer5OmSFZt3tqFe0XY9fCfv
 rzas7VnKIn3Si6Ijbd/pKl8kJVFqUmikDSOWDMpaOtQ7DzBuDXz8wJVXGNaOf4Er9Odj
 22Uq9EH3C8lpc434rv0CpH+ggT2oM+ImsTE6s+NIhpBZzpeelzddI+xigpkvVJ7nIkU7
 t9Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj8F0+y60zzSifxrWQEKNklgz75NT7k2BZcHjOHpznpF52clDw8AvLRqcWrhzYuYh20R5mjaT0Fg==@nongnu.org
X-Gm-Message-State: AOJu0Yy1oWVcVR9CCWY4hrymY6l4q0HSjGPfSwTaxP0KUQNs5jHDX3mM
 /z2YzsPDpABGeDzMezVzgVyJwla10lYIHkWOLy6bEPn3fwyTN1iOLkeILe3DWIxsWFjNKMr7DIh
 qZqEm9TBbQZSd6PFqeuTGthEUAmiyL1HKSnjcAcWdrA==
X-Gm-Gg: AZuq6aJCBcP7xo5c9twmjI+yWQFTD+H6TAOrkcowcglWGyzHDAvBG/P/hSZvmO5eRpE
 XsrK742MdVvryIhRabiDpcx4LxUrhm76wjp7IrwDKTkGIRLhRc7UMwdzpP5alg7LZ8zSFV+X8kp
 x1Oc4vXhB/8+mSVpzhMsjuWoRoHkkwVOFw8OxqHsFjWo7G+qqyRF5Bk4blKccbYTBWdqQ21wnlJ
 Jxi+7yFUzt9WwQeNZpkKRLf1UNco2s/RHtwhIdwHjRHFmAFZdH73xyK5Sew+EAvw0PYJg==
X-Received: by 2002:a05:690c:6a0e:b0:792:725c:a35b with SMTP id
 00721157ae682-7945a83756dmr32776877b3.4.1769437859784; Mon, 26 Jan 2026
 06:30:59 -0800 (PST)
MIME-Version: 1.0
References: <20260126141820.719492-1-clg@redhat.com>
In-Reply-To: <20260126141820.719492-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jan 2026 14:30:48 +0000
X-Gm-Features: AZwV_QgfWO9T-zCQFxmSuZ_5v4EERZFEwWgw1qZcWbA-G8V7-i8KfEIOzcR-y_c
Message-ID: <CAFEAcA8xQmUa7DyR7+Nw255e_DW=uzZ-gQT5G6cd-uuWgQBaUg@mail.gmail.com>
Subject: Re: [PATCH] hw/adc: Fix out-of-bounds write in Aspeed ADC model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Elhrj Saad <saadelhrj@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Mon, 26 Jan 2026 at 14:18, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> The 'regs' array has ASPEED_ADC_NR_REGS (52) elements, while the
> memory region covers offsets 0x00-0xFC. The aspeed_adc_engine_write()
> function has an out-of-bounds write vulnerability when accessing
> unimplemented registers.
>
> Fix this by using 'return' instead of 'break' in the default case,
> which prevents execution from reaching the s->regs[reg] assignment for
> unimplemented registers.
>
> Reported-by: Elhrj Saad <saadelhrj@gmail.com>
> Fixes: 5857974d5d11 ("hw/adc: Add basic Aspeed ADC model")
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>

Seems like a good candidate for Cc: qemu-stable@nongnu.org ?

thanks
-- PMM

