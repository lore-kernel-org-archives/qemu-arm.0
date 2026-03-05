Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C200F30923
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 09:31:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vy52w-0005iX-2O; Thu, 05 Mar 2026 04:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vy52u-0005iE-Fj
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 04:31:04 -0500
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vy52s-0003Lw-SC
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 04:31:04 -0500
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-794719afcd4so72704107b3.1
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 01:31:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772703061; cv=none;
 d=google.com; s=arc-20240605;
 b=Cix7DH1i+f4kE9JgpuL2UQv7Ikx+gq8JEswlqcaiwW6FvpjEcu04LVHXdiDzFa8Kjp
 gtimPG6VMUSWSouQ1WR1QBOcUU+uHHkZbFRhvmjxI/COQLVWuT1algrF3MxTyVz6aJFk
 cIc1FI1g1ddIqw9cmNtmZ4akrCLdV0BTEYIdMVw0Ke5lFlS05iqK2i7dsG3yJLMShjOe
 WVu8F5VZlgQG/r6uRgdHOkqy9Q1vqRsv/PQ2FCYWJv7kW8Hz7kuhB0RO/Uk3Y3KLTU0/
 dD/qQTEdu2hBJxVnrROfYYobg2uRI4404EX0AQ9hGT1mcwzyW3MgnO/u8WtzyjmMcXVq
 Yjdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tDoGGukLguIzkJFYbeEw6RZie/P8y8tXXjOxYEXSARw=;
 fh=bs8afNYanGEKUpQTNsc85obUp3z1f3CWfPmOJlEqGCA=;
 b=TkHJbUjq9DftxKcXDEzt2MsXFL5BfIqigP2tf1TaFi6d8Ml/5Ka9i/5ZHh+Op94arf
 /ncSCk+KEtCEz7O0e42Euj5jCgMJYLFjSmmy/nqykZZp0wW7kx1pbonVP1rBJMmdsCvk
 f5arJGsXCPL3khJGaFBTHzfvaOTBx9RrPn3KX21cCM2TRa1FjfKFwdS2/MZ190rxtKO0
 hJHtd3S7EPAKIG+IGn1HLk1VGyhzq0TPMCLgLytry5LWu4qq4K2gXZCKkHnrVoeN986q
 NE7OiAV6kopK8yjQ+lOYMWpKRZuRkejX6Y2ppNxHms2b6o1KM3cY3Lkc4Sz/1NvlL/PE
 X01A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772703061; x=1773307861; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tDoGGukLguIzkJFYbeEw6RZie/P8y8tXXjOxYEXSARw=;
 b=Pbs9gEj5RVpYSXbvWQvAiNEiqC36kjZBMaiVGTLF1dfbZ6m0iHGkXQkeDupy5CWJp8
 +HYJo9IqB8+SPmjvB8Fgmr7Fk9GF1q56j3RHlJXoKPpaUDsAkXyOTcspMF3vOalGoeHV
 JHgcjONNTBgRnmi64SYmpqXk8flG4mlKtypS99dfvEeQz/5hjqMiBNpWbq23I01IDLSG
 qafuW85LPzCIfn/MPI/uGYe6FBKdrFdzde830yXKHqrAPxlFyOVw2cFkem/VxDvBHgrU
 pq3qwoiJmwGl15msg1SdemTHh6aPjpwjEBP5ap4wqMnE5zLxvasEIuoaK5AzdLSdcsVo
 VyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772703061; x=1773307861;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tDoGGukLguIzkJFYbeEw6RZie/P8y8tXXjOxYEXSARw=;
 b=q98Z5iEk8b5dtFimLPmeeETv5RG9RFRnuK2A/hS6rgqIllXINkU2OjSRztwCu1dZFC
 uN8JrGHNC7sf/KOQmmFdoqu+weAD/KOQHRSeCgnJG4LPwfsBiRmBJS15WlEFnpsj6lE5
 aFPOaZABUETMuDH5R/E3HTWCkmmguqmZqU2cpKv1p4OPteHXnCv+s2fi2VbYE4m7x7zG
 ZgmYjlz+DQkPEvGox8xPw690KPCpFmGWZCvdSuBgbzZhJZ124eBMNurMgauTd6XkeQXH
 rkbkvwOI4iakhFoTTY2QD35L/+CB0iJuvvWfzo36xjxkDpl5S/dB+37NUZQtFF1DbMMz
 Y05A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnZKjBX/Qgiagog8ILZlPEbHY8/8A5q7f6AaqsWRi8Yf5YTyIm9tu+hIkvrswhKBJxBkP4DCMBMw==@nongnu.org
X-Gm-Message-State: AOJu0YwIo1HZzSbnK9eOrSPUgQy5LymNElYX0eRSqT+06ZPgWZAcQRLH
 0nphIfhf900/NhOk5Q9HCj2RZ30Q7SbteQKM2kFL2sHDExvy5pcqZ2JQSLG1/zXC2/KiRCusG75
 VwGc9KNkftpIXZlNZ70RGrstv9IO6goPgmYDr8LDEkMSAbFEK/rNK
X-Gm-Gg: ATEYQzzQ6O6hz+4n+w0oIUth/0RUFENR1dOmPzN8yaGXHNWEQ/pHrrh0537M4f28yer
 rOSKpsE1EYuhISvaZQNZ6Pd6VqW9ceA2hvg857UOcTZCnLXHG4I+Zw3FUuv46o/toC7yfw7Sv+z
 fjFdZpvRwZsDXfdHcKZQqJwzrZfLXTaU8ysCQJh7hIZUY0oOE2vxUXdbs05EX1ku6R8M+RdDzZn
 rouK0PihIOQv/HNK+qYRQK/hsgYHsvEi3s7uHvbdCFLxxPqass+7CAMZXZ91MN+/DuQ8rjnuH0P
 fbTEzRZhli7vUhhJpO3Mdgbwdbj8UWXdaGb5eITq/akmvzA/tMVw0MCHnNFFMuN5a0o=
X-Received: by 2002:a05:690c:670a:b0:798:58be:324d with SMTP id
 00721157ae682-798c6d042ddmr39867387b3.55.1772703061234; Thu, 05 Mar 2026
 01:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20260303222143.142741-1-shentey@gmail.com>
 <20260303222143.142741-13-shentey@gmail.com>
 <87ikbbixy5.fsf_-_@pond.sub.org>
 <CAFEAcA_WYkAYccog-BiA6MJAvoFVwa6niKvFZ7UpLjzkRyd6aA@mail.gmail.com>
 <87fr6eocfc.fsf@pond.sub.org>
In-Reply-To: <87fr6eocfc.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Mar 2026 09:30:49 +0000
X-Gm-Features: AaiRm52bSeGJD1lQtiMyl4LniLGXSmafvCc640lpMO97fckjyIgvBsHKps7UTAg
Message-ID: <CAFEAcA8CTLsKxJ8iza9T3bSafdgaM0dag2=KXqWLdMiXAHiGGQ@mail.gmail.com>
Subject: Re: QOM parent type "sys-bus-device" vs. "device"
To: Markus Armbruster <armbru@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Helge Deller <deller@gmx.de>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Troy Lee <leetroy@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-arm@nongnu.org, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Thu, 5 Mar 2026 at 09:25, Markus Armbruster <armbru@redhat.com> wrote:
> > Disentangling reset is extremely painful -- I don't even know
> > what it ought to be doing. Maybe propagating along the QOM tree?
>
> I think this would make more sense.  Unlike the qtree, the QOM
> composition tree contains all devices, and reflects the actual
> composition.  It's certainly closer to the real reset tree than the
> qtree is.  Is it close enough?  I don't know.  If yes, there's our reset
> tree.  If no, I guess we could still use it as a base, with manually
> corrected reset lines where the QOM composition tree is off.

Yes. We really don't want to add more boilerplate requirements
to how you write "container" type devices like SoC objects.
It's already bad enough that you have to have an instance_init
that manually calls instance_init on all your subcomponents,
and a realize that calls realize on all of them. If we add
a requirement that you need to have reset methods for 3 phases
that call reset on all your subcomponents, people are going to
forget. We need the default to be "do the thing that's right
almost every time", not "do the thing that's wrong".

(And then of course there is the "how do we get there from
here?" question :-))

thanks
-- PMM

