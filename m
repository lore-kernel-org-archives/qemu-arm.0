Received: by 10.25.21.96 with SMTP id l93csp1142970lfi;
        Fri, 24 Jun 2016 09:54:57 -0700 (PDT)
X-Received: by 10.237.41.134 with SMTP id o6mr6148518qtd.12.1466787297482;
        Fri, 24 Jun 2016 09:54:57 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p2si1122309qkd.65.2016.06.24.09.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 09:54:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45015 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGUNc-0006ud-Tk
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 12:54:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGU9K-000103-Am
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 12:40:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGU9I-0002ak-CD
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 12:40:09 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:36521)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGU9H-0002Yy-5I
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 12:40:08 -0400
Received: by mail-vk0-x229.google.com with SMTP id u64so158028319vkf.3
	for <qemu-devel@nongnu.org>; Fri, 24 Jun 2016 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y2G5XgPCaY4l3EYs79lcyDJseIz9KUKn+hVKxXMZAIE=;
	b=daR/S8mnYCMfQ+Mo7r72fJVT3NKddYdgXp9B/BEULumnNy/GE68arOnvjaSUVrWePg
	tsPGDKt06W3ZvpRRNW4NmGxguLN1YF8BorhKtj789ALgJocgH7WgrHsz2/sEbmCqHi8C
	7PangaSaZctLNe0UOMUP34PaQ1kTIQ5jr+6es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y2G5XgPCaY4l3EYs79lcyDJseIz9KUKn+hVKxXMZAIE=;
	b=laa0Pq3+BODUMsoswwmc7LGO5pV8gLRvqLWsurcDCDKAc0e2TrthT9FGspCFAWs81Z
	s7JQUtFwU7dIkgDmwqo8GGkYPV2Wod+Vd1FjiF+/74Tg2bN0/ohSwT/nj4mEVm0mEQn/
	qCytfbOz9eJ5CekRvgzqC6+yz3PJol/Vr1p3g87fqoein8tzO1cNuRR/fhl1tdP5/4Qd
	jioX7LY6xxu7D6UkrALThimBrk1S0d7y+h4GV96QFbmQvVVpbXqC/U24Bo+CQb40dmVu
	J3MjM8jrDaVF1p6o2CF18SQIipfoLDFHQDHFs6y+PP39eSYWDm49sCAV4i/jnDhqwvUJ
	va7Q==
X-Gm-Message-State: ALyK8tLEy4TF8vd/KdALRksDeXl00XLahad3M8zGVbMWs2F10oBqbBV8Y6BAWPDH1kxeVxyQlvfJC7aFdWLpTZws
X-Received: by 10.31.109.197 with SMTP id i188mr2989454vkc.157.1466786406420; 
	Fri, 24 Jun 2016 09:40:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 24 Jun 2016 09:39:47 -0700 (PDT)
In-Reply-To: <CABoDooN=17nBE0oMVmi_KN2RGN-jC6LGrRyp2s0hT4ed-tbgKg@mail.gmail.com>
References: <1466783381-29506-1-git-send-email-peter.maydell@linaro.org>
	<1466783381-29506-3-git-send-email-peter.maydell@linaro.org>
	<CABoDooN=17nBE0oMVmi_KN2RGN-jC6LGrRyp2s0hT4ed-tbgKg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2016 17:39:47 +0100
Message-ID: <CAFEAcA8+xKtAx3xauW0621pomJtafbh3wN+66m93ygb8DFzqMQ@mail.gmail.com>
To: Laurent Desnogues <laurent.desnogues@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-devel] [PATCH 2/2] target-arm/arm-semi.c: Fix
 SYS_HEAPINFO for 64-bit guests
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
Cc: Tsung-Han Lin <tsunghan.tw@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y93RwxGLclIf

On 24 June 2016 at 17:09, Laurent Desnogues <laurent.desnogues@gmail.com> wrote:
> On Fri, Jun 24, 2016 at 5:49 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> SYS_HEAPINFO is one of the few semihosting calls which has to write
>> values back into a parameter block in memory.  When we added
>> support for 64-bit semihosting we updated the code which reads from
>> the parameter block to read 64-bit words but forgot to change the
>> code that writes back into the block. Update it to treat the
>> block as a set of words of the appropriate width for the guest.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target-arm/arm-semi.c | 47 ++++++++++++++++++++++++++---------------------
>>  1 file changed, 26 insertions(+), 21 deletions(-)
>>
>> diff --git a/target-arm/arm-semi.c b/target-arm/arm-semi.c
>> index 8be0645..d50726f 100644
>> --- a/target-arm/arm-semi.c
>> +++ b/target-arm/arm-semi.c
>> @@ -564,8 +564,10 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>>          }
>>      case TARGET_SYS_HEAPINFO:
>>          {
>> -            uint32_t *ptr;
>> +            target_ulong retvals[4];
>>              uint32_t limit;
>
> I think limit should also be converted to target_ulong.

Yes, it should.

thanks
-- PMM
