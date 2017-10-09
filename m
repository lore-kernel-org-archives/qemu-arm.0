Received: by 10.223.197.9 with SMTP id q9csp2666571wrf;
        Mon, 9 Oct 2017 10:14:25 -0700 (PDT)
X-Received: by 10.55.197.152 with SMTP id k24mr9525884qkl.178.1507569265595;
        Mon, 09 Oct 2017 10:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507569265; cv=none;
        d=google.com; s=arc-20160816;
        b=nqTcgPvOTGs7o9jV1AIroksMRgecD4HSx/CSsLfC7hdRD+Mh/ncsVT9srUk+s7Fj+9
         279FKEuAxlYy9NDoCq3fuDfuRIFuVQGwNRnx8C2iDnVXZckZdf0+AqfReIvpXWyPHFm6
         S/pnasP2nBxquDp6I18jzOXtKdjMrDnlTQUubtefxXjLYxi8d74dUFrAUqk6vSg1mzDT
         jGPyS5F9y/AJ7gOjqsky7WRgfWWnJ6Q6uGD+pJS3TlFX9rZYgp2BUbaAgc0oYDhC6KYs
         BZYFpqzzr9HmvFANgIrc4gRmKptQ4KrD8wAauiNCcIhTbjx8xDw/9oWJt4sCMxLVs+1a
         AfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9NP+eARie8R3T2O6MVgkSVevMEHn9HBQmr8moBz1ioA=;
        b=CQ+ADcujuauhnZnOK90e8g4xzVyVYIDMoy3EuA96PMRK5gRQxVvBtaFgkeUeS4zdvR
         OBP546hnwiZV0BxQTa4QBQ3fj1Fr29dVia3G4IftnJyQt2CfbRiomTU2Hgjn/1okl8YX
         ulTwxyxaqmguGC+Ep5Ba7H3+w36dK+furxcILHoRfmTmbrMSs1QyI7YSDgfLM1Dz5WzG
         UP1gIUbIHC3UnvYeC6YieYZldlXg40Y1nM1uuQsjwLTysGadfnFmSSTjse0FkV8ohMtJ
         Lt98jGMHWQ6KQWBbSHwkQtpXgl1irJGLjua6LhWBakeHQ39YhGZEER8RBUWNueoHTqqF
         aN0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jw8WPK2q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c16si6720499qkj.104.2017.10.09.10.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 10:14:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jw8WPK2q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58964 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1bdJ-0005s6-4U
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 13:14:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1bbv-0005Dg-Fz
	for qemu-devel@nongnu.org; Mon, 09 Oct 2017 13:13:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1bbu-0005ed-JN
	for qemu-devel@nongnu.org; Mon, 09 Oct 2017 13:12:59 -0400
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:50189)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1bbu-0005e3-DX
	for qemu-devel@nongnu.org; Mon, 09 Oct 2017 13:12:58 -0400
Received: by mail-wm0-x231.google.com with SMTP id u138so24381387wmu.5
	for <qemu-devel@nongnu.org>; Mon, 09 Oct 2017 10:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9NP+eARie8R3T2O6MVgkSVevMEHn9HBQmr8moBz1ioA=;
	b=Jw8WPK2q3Y3Mc3xWTNMhso8gSivSwFo+QQkrLr7kSrkVBQRJ5pDKd92T/HdWcw3ylR
	kJoNywVwIeNFtSjD+6qIgqOOMQA7cRTgf3+6/GklVS48W1Q5E6aNS42XBbhwvs1lQj6A
	daRwWC8Zkdg0F2WBwBeffsRQyse2+Kb4oSI2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9NP+eARie8R3T2O6MVgkSVevMEHn9HBQmr8moBz1ioA=;
	b=MH58lZ0fcR3anzeI9gOF47mu8J3P1VhtHdh3VpSfLUvpmcU1FVSp9m39oQUntABr7q
	qNkhT/nqPj/yOJvo48T1nH3djYhqjaaunu8KdM4jcUKwqz9bHE3W1Ukvqr9XB9EPJGzJ
	HRrnabRMCPWoeaQrJo16/bgaJ5JLRxnaFeL5mWqp5wLcFLt9jhpcqHegtaKvMNj70G7/
	NmMkjJQalgxYIBC8ofGrSWm9KCPbQEWCkEpTKTaMlo8pybSt1mfuPgRr5MSJJNy/D0aM
	2Bhf5c/8/C5N9eUX0TvkWAunsfWjsQlrAhdZds2Nfv8tDCCgVzf+mtcXBXZKXVJR6UPP
	vvOg==
X-Gm-Message-State: AMCzsaWz7smxvxQb+iOEXLzDLFP6TA9HBwISiOOTS3hoF08ywj88PIsY
	ZLXm1breQiEAyDWisq6AskFDHZ8odbZjW5ZipNjBRA==
X-Google-Smtp-Source: AOwi7QDQdIkM8PyjvrOoluBfDm5ML3W04rglmhs0P1HdkAKAlFEw59vdutalJIJsDI+omxm3gzf8IMUXkuaAMyHQa7s=
X-Received: by 10.28.113.196 with SMTP id d65mr8025267wmi.151.1507569177402;
	Mon, 09 Oct 2017 10:12:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Mon, 9 Oct 2017 10:12:36 -0700 (PDT)
In-Reply-To: <1504286483-23327-8-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-8-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Oct 2017 18:12:36 +0100
Message-ID: <CAFEAcA-QNCreM0JQZYgHpE5kwXoidrY=gxzSfSgMJsEZ_5D=Jg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-devel] [PATCH v7 07/20] hw/arm/smmuv3: Queue helpers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	robin.murphy@arm.com, wtownsen@redhat.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6kWn6d95fYil

On 1 September 2017 at 18:21, Eric Auger <eric.auger@redhat.com> wrote:
> We introduce helpers to read/write into the circular queues.
> smmuv3_read_cmdq and smmuv3_write_evtq will become static
> later on.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

See comments on a previous patch where I suggest a better
way to implement the queue increment/wrapping handling.

> +typedef enum {
> +    CMD_Q_EMPTY,
> +    CMD_Q_FULL,
> +    CMD_Q_PARTIALLY_FILLED,
> +} SMMUQStatus;
> +
> +#define Q_ENTRY(q, idx)  (q->base + q->ent_size * idx)
> +#define Q_WRAP(q, pc)    ((pc) >> (q)->shift)
> +#define Q_IDX(q, pc)     ((pc) & ((1 << (q)->shift) - 1))
> +
> +static inline SMMUQStatus __smmu_queue_status(SMMUV3State *s, SMMUQueue *q)

No __ prefixes, please.

> +{
> +    uint32_t prod = Q_IDX(q, q->prod);
> +    uint32_t cons = Q_IDX(q, q->cons);
> +
> +    if ((prod == cons) && (q->wrap.prod != q->wrap.cons)) {
> +        return CMD_Q_FULL;
> +    } else if ((prod == cons) && (q->wrap.prod == q->wrap.cons)) {
> +        return CMD_Q_EMPTY;
> +    }
> +    return CMD_Q_PARTIALLY_FILLED;
> +}
> +#define smmu_is_q_full(s, q) (__smmu_queue_status(s, q) == CMD_Q_FULL)
> +#define smmu_is_q_empty(s, q) (__smmu_queue_status(s, q) == CMD_Q_EMPTY)
> +
> +static inline int __smmu_q_enabled(SMMUV3State *s, uint32_t q)
> +{
> +    return smmu_read32_reg(s, SMMU_REG_CR0) & q;
> +}
> +#define smmu_cmd_q_enabled(s) __smmu_q_enabled(s, SMMU_CR0_CMDQ_ENABLE)
> +#define smmu_evt_q_enabled(s) __smmu_q_enabled(s, SMMU_CR0_EVTQ_ENABLE)

This code seems to be rather macro-happy.

thanks
-- PMM
