Received: by 10.80.163.71 with SMTP id 65csp1205291edn;
        Tue, 20 Sep 2016 14:19:50 -0700 (PDT)
X-Received: by 10.55.45.1 with SMTP id t1mr37910104qkh.182.1474406390891;
        Tue, 20 Sep 2016 14:19:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q35si25684385qtc.85.2016.09.20.14.19.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Sep 2016 14:19:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38173 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bmSSE-0007lA-Ao
	for alex.bennee@linaro.org; Tue, 20 Sep 2016 17:19:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bmS7l-0006qU-E3
	for qemu-arm@nongnu.org; Tue, 20 Sep 2016 16:58:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bmS7h-0005jM-8o
	for qemu-arm@nongnu.org; Tue, 20 Sep 2016 16:58:40 -0400
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34754)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bmS7g-0005iz-Tb; Tue, 20 Sep 2016 16:58:37 -0400
Received: by mail-lf0-f67.google.com with SMTP id b71so668983lfg.1;
	Tue, 20 Sep 2016 13:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=7/U1kmGSQbdrxNQu3OUyzCeQ23Cezm6couVELs175is=;
	b=e8OA/DOBR4lc4Y5vgJCBtespHKPzEyPn4OjvH8GKL8tWJpLJFTgQlywp/WWFpoSblP
	SSGHUAnf35Y8KfUmwLZriAJp1IoMubmm0YxdFtvMbYcjNtCcJunSvMZK1QofTFCdvP/e
	EwSV/wK6cFXqTkRhNEOiKvj37aK+rwfkBmPXRh2geolQ6jgccAiB5i+AOnGwWQ5sYcA/
	zMfZu4K1A4+hZ2XkFKMjqNni8EEgJSFCaVR6uQ/bMIC2yFMgF9TTL05S2qbFdf8y1Vir
	ETIpcfyg2p0Fxpmu3WkmqnflHvnD0AOxKAUZLQXPHo85lzHJPOqHiOllTjAlU7LXZwnX
	4MIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=7/U1kmGSQbdrxNQu3OUyzCeQ23Cezm6couVELs175is=;
	b=RcG78xYf9tqbKv19kSKHN13HFVReKfxZwHV/mrLGqmEGd6Es64sqj9aSFOmVFFQNTG
	o1cnroZsjOW93byuWZY1YQSJPQB4RORfP1XDMMEAxpgTNHl+g21UMRns3P7rtbzCp0Kk
	nU4ux53wGhAxWppZTP5GycmxckabxE2vNPKgqPkxcyzzZKAlfgjYwxUfvRnU5xW+XrTM
	jbymLEqm2H2FncK+0gB1zTiZYSh/hTPpqa4KrTFK54cz6772JlKLBDSxDbcvCkHue+wF
	wUZw5UjQlzcJqM8iPMfN3MlHRB5TkhCWqxD1637utnLGZ4vnSCvrmE7qRTuj7BRatijU
	dJ8Q==
X-Gm-Message-State: AE9vXwMORwoADXWmF29kNaFFSxiN/NSKj7ebZuEQXom/MJi14wLWDe6+Md4xanCaDDFD4A==
X-Received: by 10.25.228.88 with SMTP id b85mr10764513lfh.175.1474405055521;
	Tue, 20 Sep 2016 13:57:35 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.googlemail.com with ESMTPSA id
	g201sm6151245lfg.8.2016.09.20.13.57.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Sep 2016 13:57:34 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1473252818.git.digetx@gmail.com>
	<586d1643bf90bab81322ae34b9b68c10458249a9.1473252818.git.digetx@gmail.com>
	<CAFEAcA_4xVH0PzytZpvyCTCgxm2TORg20C=UKHVApeVdkMvneA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f89e38b1-1e8b-d7ea-4618-57bed00a2936@gmail.com>
Date: Tue, 20 Sep 2016 23:57:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_4xVH0PzytZpvyCTCgxm2TORg20C=UKHVApeVdkMvneA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.67
Subject: Re: [Qemu-arm] [PATCH v16 05/16] hw/ptimer: Add "wraparound after
 one period" policy
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9oLyWcAg/50N

On 20.09.2016 20:20, Peter Maydell wrote:
> On 7 September 2016 at 14:22, Dmitry Osipenko <digetx@gmail.com> wrote:
>> Currently, periodic counter wraps around immediately once counter reaches
>> "0", this is wrong behaviour for some of the timers, resulting in one period
>> being lost. Add new ptimer policy that provides correct behaviour for such
>> timers, so that counter stays with "0" for a one period before wrapping
>> around.
> 
> This says it's just adding a new policy...
> 
>> @@ -91,7 +96,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>  {
>>      uint64_t counter;
>>
>> -    if (s->enabled) {
>> +    if (s->enabled && s->delta != 0) {
>>          int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>          int64_t next = s->next_event;
>>          bool expired = (now - next >= 0);
>> @@ -145,6 +150,14 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>                      div += 1;
>>              }
>>              counter = rem / div;
>> +
>> +            if (!oneshot && s->delta == s->limit) {
>> +                /* Before wrapping around, timer should stay with counter = 0
>> +                   for a one period.  The delta has been adjusted by +1 for
>> +                   the wrapped around counter, so taking a modulo of limit + 1
>> +                   gives that period.  */
>> +                counter %= s->limit + 1;
>> +            }
>>          }
>>      } else {
>>          counter = s->delta;
> 
> ...but the changes in this function look like they affect
> behaviour even if that policy flag isn't set.
> 

No, the delta value is adjusted only when PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD is
set.

+    if (s->policy_mask & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD) {
+        delta += delta_adjust;
+    }
+

That adjustment is applied only on reload of the periodic timer.

@@ -83,7 +88,7 @@ static void ptimer_tick(void *opaque)
     if (s->enabled == 2) {
         s->enabled = 0;
     } else {
-        ptimer_reload(s);
+        ptimer_reload(s, 1);
     }
 }

All other ptimer_reload's are ptimer_reload(s, 0).

The periodic timer is reloaded with the limit value. When s->delta == s->limit,
we can assume that timer is free running. When delta is adjusted by +1 on
reload, the counter = limit + 1 (counter value is calculated based on elapsed
QEMU time) and that "counter %= s->limit + 1" modulo gives counter = 0 while in
fact the counter = adjusted delta (limit + 1).

When delta is *not* adjusted, the modulo returns the actual counter value, since
counter value is always less than s->limit + 1.

So, this patch doesn't affect old behaviour at all.

Looking more at it now, I think "counter %= s->limit + 1" should be changed to
"counter %= s->limit" in this patch and +1 added in the "no counter round down"
patch, since the counter value is always rounded down here. Instead of the
"staying with counter = 0 for a one period" it would wraparound to the limit
value if "wraparound after one period" policy is used. I'll change it in V17.

-- 
Dmitry
