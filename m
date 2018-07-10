Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3444906wrq;
        Tue, 10 Jul 2018 04:24:12 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcHAGBw52YwFIKIgKK2MFUnKhk60w4DF4ZufS+Mvp0eMOjYFEbKqoWsbwyyCznk8JW1Lmhf
X-Received: by 2002:ac8:f5b:: with SMTP id l27-v6mr22258935qtk.158.1531221852775;
        Tue, 10 Jul 2018 04:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531221852; cv=none;
        d=google.com; s=arc-20160816;
        b=N8HRFZnvjYsC9JBKWNch/GgOxfmIqTK+yaOt6RAQkb2pJzMciRvqAI60snY/zF6O8v
         W2qlt0Wos/+M3MafgM7IrQ98rzp37I32mrG0M8oXwgSTElQ6zcEF7uGwvB0Q8GkO3oKP
         lk7xXU78ao3u4zuuLWQ4HXvnRCbP3uPs0fiHsfP9sKZ5ByKemsYV4h3D4f4AgE8hpy7E
         IqvlCB0M2WXCyooBgXCX+2zYphkVgHdIG3+rtXCiyECnzzljNV9yqtQ4kqCQg48ZIGVO
         pb535bih4zP9rjlUM2ILvADGEPXEWDBkYWyo7fx5BC6LBQdfDRJlreGv+AVCnt8okjIg
         UzUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=hiClbCeKDi7CX3ubmlAQNG4ldjt24Ec2cey12W2w5Yg=;
        b=spwnlQhm54zIC8fHoam5OnbpKGRPrgQUmFkekH1znF8ANAhm1JCJ9i7t0dzHAJHH7f
         4Y2Nn9TYuMchxkOhaCZH0c4OY3CMzv99r7tJWpMEclSXC22DCWl3PfReYQA8K7UvuoV6
         yyQXNVlsFljXjyn260eLh6yHdJXHPq9jNDMqPDD1I87ZtXdElbJ1KJtfFwbHsTnV6GL3
         jTnPm/jFBk6TE9L1p07IvfPocG+mYK1d+EOAYPt3PlTHFtKm/xZvppxU+aT+65T6V3AO
         UfZMugEJpidq60rofKnGtXFDCmRJt+YGjdIe8Yg074JTIc2zevR1Z1ZbgeSwwGKzYTfJ
         8/lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GoHynzU7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i2-v6si6721159qke.42.2018.07.10.04.24.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 04:24:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GoHynzU7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcqke-0002Tq-AD
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 07:24:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcqkR-0002TA-SN
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 07:24:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcqkR-0005jy-0C
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 07:23:59 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:34191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fcqkQ-0005jq-PO
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 07:23:58 -0400
Received: by mail-oi0-x241.google.com with SMTP id 13-v6so41890566ois.1
	for <qemu-arm@nongnu.org>; Tue, 10 Jul 2018 04:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hiClbCeKDi7CX3ubmlAQNG4ldjt24Ec2cey12W2w5Yg=;
	b=GoHynzU7Uk4N83SrH2eyj+0gXtBqPhL5Wzquy8a5+lNKLMruZfb9mJ6Un3E3EmNkcd
	vjPFOFmzuyKO4/cO28Bt2E12xqjN+CmhpiiHevyp8LDmKKX0XmrCoitWA8jJGCP/nNmZ
	1FXS0p26Q9uI447dqyC+Fde+3uAR0K6Xl3BPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hiClbCeKDi7CX3ubmlAQNG4ldjt24Ec2cey12W2w5Yg=;
	b=Gdvz0DTRuwWQbFzOz+pxDJVEBDXWV1X+Hn8EZ+U8lYpIOVxPZCgVcFRiWRnld/1SE0
	uVS8N7Y3/tawBkTW1FNI0ZsxrYGO89AotfSB3F13SEFBGySv8gBoKAz/zumvD2CXavgE
	7Bm4a28ZbgbIADgVNYZ40pzsoOG7wULvFQy2PnB6ozLANNKLD5yiTRVPGrbeVCKc9sbx
	6UUw08QRFYmWDUYUtNcTW9ZPOfqd2TxUaZJHXIztFXYE8+AegayJuVPIxgrnFQHelGlQ
	bdmgi7kN03DuQNqmeBkbUs6Tm9cu8SZIyQ8Dti6XUbBWFeFyC3bHoqsv2e8S0yBnp/79
	0eqA==
X-Gm-Message-State: APt69E1Rj8IGuQKx/cN4w3lr+Qn0OPJCo++fswWCXhYrzKxIbNDrnhs5
	/Efft/iOMhjQ4c47I/caRqoIT3kVuMLJ3ZRvu+u2Ig==
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr28872171oih.102.1531221838102; 
	Tue, 10 Jul 2018 04:23:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 04:23:37
	-0700 (PDT)
In-Reply-To: <7fafbf1c-9af1-cfb9-24c7-ee9a00ef9d4e@linaro.org>
References: <20180709124535.1116-1-peter.maydell@linaro.org>
	<7fafbf1c-9af1-cfb9-24c7-ee9a00ef9d4e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jul 2018 12:23:37 +0100
Message-ID: <CAFEAcA_F03w0REiTrT-Xi5cGcBtnv5m3RK4f6QvU+bufSEhb7A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.0] target/arm: Use correct
 mmu_idx for exception-return unstacking
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Adithya Baglody <adithya.nagaraj.baglody@intel.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MLWMYlDJeGxi

On 9 July 2018 at 15:30, Richard Henderson <richard.henderson@linaro.org> wrote:
> On 07/09/2018 05:45 AM, Peter Maydell wrote:
>> For M-profile exception returns, the mmu index to use for exception
>> return unstacking is supposed to be that of wherever we are returning to:
>>  * if returning to handler mode, privileged
>>  * if returning to thread mode, privileged or unprivileged depending on
>>    CONTROL.nPRIV for the destination security state
>>
>> We were passing the wrong thing as the 'priv' argument to
>> arm_v7m_mmu_idx_for_secstate_and_priv(). The effect was that guests
>> which programmed the MPU to behave differently for privileged and
>> unprivileged code could get spurious MemManage Unstack exceptions.
>>
>> Reported-by: Adithya Baglody <adithya.nagaraj.baglody@intel.com>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target/arm/helper.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks; applied to master for 3.0-rc0.

-- PMM
