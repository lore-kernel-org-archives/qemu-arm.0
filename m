Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2066172wrq;
        Sat, 30 Jun 2018 12:42:20 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpepErwZyGtrxUVBY88XFzqEODeRMQizUkuRSxVOveI24SDF8SV1fyI5KMSzsaf3C0vdoopC
X-Received: by 2002:a37:1bc6:: with SMTP id m67-v6mr17861771qkh.380.1530387740218;
        Sat, 30 Jun 2018 12:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530387740; cv=none;
        d=google.com; s=arc-20160816;
        b=vR5F8NJkvU9aN+Y2TfY5cggyGOz20Vm7meQJcQqiGKjh/WliI8h+NXnBzNjFLKu6qC
         J3q6eGUBeT9wuJAP2BW3dz+SnUyh2hJK6gOxN1EaSZ+Npne+O6YTwI4KcUv6TisBXgDi
         h9hRZ3wC9EGsdQgBCYTn3qsZ5uM5Zx79WJdI8PH3gvYTav4TSnj7T0v5BH83XrfTUArD
         KYXJcRpSl/2XguJh6tr+qzEwOH5cUIxaALzdmij94/hzHsHwgIg8L5kejYN5MGJNUdZt
         6V4VoS3ZgaQGGgkaY8yHp5i07Jtg4Hecys1JTviBApwftElTqTVA75F4+/5ECne8tDhg
         s6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=R+Bc7hHPfgf/VCPBGjn9EaVvFEnfVphrUHwXitC2DfI=;
        b=XS8v8uDUeg9Pk7fqxtqMaS+3ZJ1EVdG9BUq+IF1Yzw+H9dVbe9Fsq6md14BsLyyOKm
         K+kjuY2HJrEgR13Chda5utY38hGrvXN8l+IVx8HLXJeptweVfnCTwUfY9LvuJKZiPrPz
         T/x1QVfidum84htDXQnEMpGXcRpEV1Wy2quhVm1A0crGQtaeb9Y5Dq7p1ObpHWamM+Gb
         dil17fdu6uEEjcdajs8Jk4MQrXUbGdl36Utx51GYjXvhkYbTsG6922G+93OGa7SpdTFv
         lEU1PYDjmJPQFLKidqyuWHumdhtcULR4a1ZfPekSlb9aKHN1cz4SFdGap2gaIlhFWgeC
         jS5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Z/bdZ2BH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v10-v6si1105855qvd.127.2018.06.30.12.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jun 2018 12:42:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Z/bdZ2BH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fZLlD-0001hi-Np
	for alex.bennee@linaro.org; Sat, 30 Jun 2018 15:42:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1fZLl4-0001hQ-E2
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 15:42:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1fZLl3-0004SE-Ky
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 15:42:10 -0400
Received: from mail-yw0-x241.google.com ([2607:f8b0:4002:c05::241]:39718)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1fZLl3-0004R4-FZ; Sat, 30 Jun 2018 15:42:09 -0400
Received: by mail-yw0-x241.google.com with SMTP id 81-v6so5425540ywb.6;
	Sat, 30 Jun 2018 12:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R+Bc7hHPfgf/VCPBGjn9EaVvFEnfVphrUHwXitC2DfI=;
	b=Z/bdZ2BHmlwImrYdhMo3bne8UNFVs3bmm5xcY2Uv7LPCahUH7834y0N51ykgw2R+BV
	yUrFFlcdBMaD1Dxz0aO0qkJpwfcqL0tN+OjQiegB13t+NWpvfjgtk+x3N77FWH6yKPzh
	A++5zV235wWohktbCWTTv52jiuCfX+Nkn4Q2qZCf8lEmCl0Rq+2gFRnkHcZ9m0R4T0Pd
	MLZZvieeQm7Jp94h3a+dIEpW1rHuF444CpwCYiIuS0ownbgfxfXEjGubeAst75u3AtSy
	gFqxzO/VXbZSGFY+JzuyMaUPliaPLplmI4LwB//Ej0K/ge5hsZ66E9GPKMl34SjKsbjH
	/jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R+Bc7hHPfgf/VCPBGjn9EaVvFEnfVphrUHwXitC2DfI=;
	b=ZjkvLB1VCHQHQ0QXMadqmRLyGWE6Mu8OheeiINcWdVu051rdDKWMSGOggi1U+VZU0j
	CoYMNNInYNa/QK3qTbNRJo/BYbgRBNWIQqZ+eY+wRpxAJbkSossgk1S5yZofoYCGyQ+u
	0ZVJlsHpLwB3z+SsyA7nny8E+IWBQYIhjagtuwCTDFzfOC5Wp770DuUkBUZ+fkLEllFX
	4hIGOraH9vmgKa0yCtzsfjikih+9vx2MQF4+lBML9yWhcOZaMD1cNehF9SL4d6CJwUX0
	XFen/tlx+vHd81E6OkAoJ046QRPaprCL6XoRIruk6k1u66KhUwN2xxXJbyubr2b/eplj
	M85Q==
X-Gm-Message-State: APt69E3kR7KjRfFc1jad/+Ehy7qRKobU0x3SNNFB/7wKFbWgCVeGcv2g
	tond8vLmu90slqk3CdRNObPBqX9Z9gSNmxMwS3Y=
X-Received: by 2002:a81:8d42:: with SMTP id
	w2-v6mr9872543ywj.501.1530387728810; 
	Sat, 30 Jun 2018 12:42:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:620b:0:0:0:0:0 with HTTP; Sat, 30 Jun 2018 12:42:08
	-0700 (PDT)
In-Reply-To: <CAMo8BfLRr16q4_nj0vacK4N4fb0EBymXZB6SHon72h7BJ9M5jw@mail.gmail.com>
References: <20180620130619.11362-1-peter.maydell@linaro.org>
	<20180620130619.11362-2-peter.maydell@linaro.org>
	<CAMo8BfLRr16q4_nj0vacK4N4fb0EBymXZB6SHon72h7BJ9M5jw@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 30 Jun 2018 12:42:08 -0700
Message-ID: <CAMo8Bf+iV3fTRtSKx8Y-Y4_e16i21shLOch2PS3v_xR_c+L0ww@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] tcg: Support MMU protection
 regions smaller than TARGET_PAGE_SIZE
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
Cc: Patch Tracking <patches@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6qLvQfyiqv9p

On Sat, Jun 30, 2018 at 12:20 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> Hi Peter,
>
> On Wed, Jun 20, 2018 at 6:06 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Add support for MMU protection regions that are smaller than
>> TARGET_PAGE_SIZE. We do this by marking the TLB entry for those
>> pages with a flag TLB_RECHECK. This flag causes us to always
>> take the slow-path for accesses. In the slow path we can then
>> special case them to always call tlb_fill() again, so we have
>> the correct information for the exact address being accessed.
>>
>> This change allows us to handle reading and writing from small
>> regions; we cannot deal with execution from the small region.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  accel/tcg/softmmu_template.h |  24 ++++---
>>  include/exec/cpu-all.h       |   5 +-
>>  accel/tcg/cputlb.c           | 131 +++++++++++++++++++++++++++++------
>>  3 files changed, 130 insertions(+), 30 deletions(-)
>
> I'm observing the following failure with xtensa tests:
>
> (qemu) qemu: fatal: Unable to handle guest executing from RAM within a
> small MPU region at 0xd0000804
>
> Bisection points to this patch. Any idea what happened?

Ok, I think I've found the issue: the following check in the
get_page_addr_code does not work correctly when -1 is in the
addr_code in the QEMU TLB:

if (unlikely(env->tlb_table[mmu_idx][index].addr_code & TLB_RECHECK))

tlb_set_page_with_attrs sets addr_code to -1 in the TLB entry
when the translation is not executable.

-- 
Thanks.
-- Max
