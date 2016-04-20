Received: by 10.25.208.194 with SMTP id h185csp2363941lfg;
        Wed, 20 Apr 2016 07:52:46 -0700 (PDT)
X-Received: by 10.194.21.65 with SMTP id t1mr9275154wje.12.1461163966397;
        Wed, 20 Apr 2016 07:52:46 -0700 (PDT)
Return-Path: <mttcg-owner@listserver.greensocs.com>
Received: from greensocs.com (greensocs.com. [193.104.36.180])
        by mx.google.com with ESMTP id z126si10397363wmg.58.2016.04.20.07.52.45;
        Wed, 20 Apr 2016 07:52:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of mttcg-owner@listserver.greensocs.com designates 193.104.36.180 as permitted sender) client-ip=193.104.36.180;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of mttcg-owner@listserver.greensocs.com designates 193.104.36.180 as permitted sender) smtp.mailfrom=mttcg-owner@listserver.greensocs.com
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 20E5A2C004A;
	Wed, 20 Apr 2016 16:52:45 +0200 (CEST)
Authentication-Results: greensocs.com;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+yjQKb1
X-Virus-Scanned: amavisd-new at greensocs.com
X-Spam-Flag: NO
X-Spam-Score: -1.788
X-Spam-Level:
X-Spam-Status: No, score=-1.788 tagged_above=-999 required=6.2
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, HK_RANDOM_ENVFROM=0.001,
	T_DKIM_INVALID=0.01] autolearn=no autolearn_force=no
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=fail (2048-bit key) reason="fail (message has been altered)"
	header.d=gmail.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AWa4CW8F5yjO; Wed, 20 Apr 2016 16:52:44 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 123)
	id 058422C004D; Wed, 20 Apr 2016 16:52:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 73A2A2C004E
	for <mttcg@listserver.greensocs.com>; Wed, 20 Apr 2016 16:52:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at greensocs.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bbvJAuw6X_dE for <mttcg@listserver.greensocs.com>;
	Wed, 20 Apr 2016 16:52:34 +0200 (CEST)
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com [209.85.220.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by greensocs.com (Postfix) with ESMTPS id 69F2D2C004D
	for <mttcg@greensocs.com>; Wed, 20 Apr 2016 16:52:31 +0200 (CEST)
Received: by mail-qk0-f194.google.com with SMTP id q184so2433120qkf.0
        for <mttcg@greensocs.com>; Wed, 20 Apr 2016 07:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Lv+DkZwcnx6hU4ImkaF6NdIpu1r/sTAfppYrVq53GcU=;
        b=R+yjQKb1SR6C8tLq1DK66LU+6/b6jXIoYuWSwjBtWuXPOBdfvcz67dZLuU7PrKJ/Ec
         ZNH7ML5Ft25J+/g0wSD/e9mRoBrK03gTWaQS/6C76cpUNGlYA89yVK6ZQngxVQc/IVDm
         0jvOrk+hxSh2uSzxDxQyY5VtUR9RD8ONcOI1+Z+5yVNOSk/gJoULXhYpvwiQWx+bXOep
         DhYmydgf/dvwZ1McCXxEO9IT1o0CZiYkT4FJ9zdbg5+UGXelCMfO/O0f3hHGtjtuGqHX
         2u0ohVzPE5BPtISUtVdqQoUn5C7nUnXy9R+Xgp76I0uVkfKKPS5OJmEwhGwOZYqzLfFt
         nZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=Lv+DkZwcnx6hU4ImkaF6NdIpu1r/sTAfppYrVq53GcU=;
        b=c/8rqWug2RQCbDXzJdWWl7hKfJAjanBrI9HOkSisA8NU8ptT2psx1X/WdyirqOSBoC
         DK0OAk2I7WB8gb4wZrccWf2bZDxSdSsDvvOq3tYkRYIkBXanD7Od6kzEQzcCnad6Viu8
         95oS2YeMyNBdAe0N0SsMvMwSfkxpDYtrL1VbfzVLKL7QIUgddDpbZjdsZV5YkuxFlvcw
         ry40Ix3FOsSvy+BtaEoWz4pFUmgCgLwdWkaA8UN/wj0sBHozxV2PI6fKnKV0xtCv4fFU
         AqjXyFidDpapLGM8NOHQW4ygnCP7Gn1YnrKNYzvU7Kkyc1M5MFDOgG2yuD3XNaTscNf6
         H7dg==
X-Gm-Message-State: AOPr4FVwlMffeH1NM8CTpizDeH3f6FJMqvbl4/9C8KNk4x/NoTF3s0Ia99cCz1Gbm63DRQ==
X-Received: by 10.55.80.86 with SMTP id e83mr11799429qkb.91.1461163950849;
        Wed, 20 Apr 2016 07:52:30 -0700 (PDT)
Received: from bigtime.twiddle.net (nat-pool-bos-u.redhat.com. [66.187.233.207])
        by smtp.googlemail.com with ESMTPSA id c193sm8777044qkg.43.2016.04.20.07.52.28
        (version=TLSv1/SSLv3 cipher=OTHER);
        Wed, 20 Apr 2016 07:52:29 -0700 (PDT)
Sender: mttcg-request@listserver.greensocs.com
Subject: Re: [PATCH] tb: consistently use uint32_t for tb->flags
To: "Emilio G. Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Walle <michael@walle.cc>,
 Aurelien Jarno <aurelien@aurel32.net>, Leon Alrae <leon.alrae@imgtec.com>,
 Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>,
 Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <1460049562-23517-1-git-send-email-cota@braap.org>
 <20160419232145.GA19286@flamenco>
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 MTTCG Devel <mttcg@greensocs.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
From: Richard Henderson <rth@twiddle.net>
Message-ID: <571797AA.2070002@twiddle.net>
Date: Wed, 20 Apr 2016 07:52:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <20160419232145.GA19286@flamenco>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: Richard Henderson <rth@twiddle.net>
X-Loop: mttcg@listserver.greensocs.com
X-Sequence: 225
Errors-to: mttcg-owner@listserver.greensocs.com
Precedence: list
Precedence: bulk
X-no-archive: yes
List-Id: <mttcg.listserver.greensocs.com>
List-Help: <mailto:sympa@listserver.greensocs.com?subject=help>
List-Subscribe: <mailto:sympa@listserver.greensocs.com?subject=subscribe%20mttcg>
List-Unsubscribe: <mailto:sympa@listserver.greensocs.com?subject=unsubscribe%20mttcg>
List-Post: <mailto:mttcg@listserver.greensocs.com>
List-Owner: <mailto:mttcg-request@listserver.greensocs.com>
List-Archive: <http://listserver.greensocs.com/wws/arc/mttcg>
X-TUID: nVd0YPZR3qDY

On 04/19/2016 04:21 PM, Emilio G. Cota wrote:
> On Thu, Apr 07, 2016 at 13:19:22 -0400, Emilio G. Cota wrote:
>> We are inconsistent with the type of tb->flags: usage varies loosely
>> between int and uint64_t. Settle to uint32_t everywhere, which is
>> superior to both: at least one target (aarch64) uses the most significant
>> bit in the u32, and uint64_t is wasteful.
>>
>> Compile-tested for all targets.
>>
>> Suggested-by: Laurent Desnogues <laurent.desnogues@gmail.com>
>> Suggested-by: Richard Henderson <rth@twiddle.net>
>> Signed-off-by: Emilio G. Cota <cota@braap.org>
>
> Has this patch been queued by anyone? If not, should I resend after
> 2.6 is released?

Sorry for the delay.  Queued for 2.7.


r~
