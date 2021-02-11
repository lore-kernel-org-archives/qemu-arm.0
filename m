Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1785926lfc;
        Wed, 10 Feb 2021 16:33:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQrDpc9HrQ9JTuVMW4ZBkCa5uWd7656o9Z8QWWVCY8iXNH+SCX/eYK/RJyDtKepCQtL/Iq
X-Received: by 2002:a25:f07:: with SMTP id 7mr8271658ybp.399.1613003634329;
        Wed, 10 Feb 2021 16:33:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613003634; cv=none;
        d=google.com; s=arc-20160816;
        b=nzhbhaC4tdzmPSDPtNvv7tgL842gUNl3bLV3hKeSDNeNddC/qVWKEr/6S31MArAZDr
         juY+B2ZHfAeolERYBfN/xo8BtGM2jAm9m2G4B6ZaNqGetN8oYcqRo9STKrcbO/GZc7m8
         onJ6wt+eNLiAB2m0cWfbGbPZv3WHiNys36Tr1C+wGEGVUiZ4UOfzRFROaFPubNyKcG4w
         1EPCIsscyXSPeTJiyiDhGVR1ZWpzsMAdcAdahYNKkg3v2trIbDs/sI7Ls6XY0R+smvD+
         f/U45wXc+gqHUKX/og8meEyqBXULeNzIVltyPsORKsWa/djvIWHiVMQ0KVpVhzfXPnHv
         uCBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=2tU0CItkjUIqgZ4Ihh39u4vaGXAWr9VE9dlDc/4vycQ=;
        b=AQQyP97ywIasuAxxmNJRRORbpjBvW2slpODIs/Pv3/3JR4ctL43KVNtW7HFfLggx6Q
         QDnI3zqwy7s7zk4JhPKaBz+unTrTBu4QvqZir/DYVANbkZVN/a8bdydB9m5nLDpEyG7h
         p9Jv182mEFrdgjajELBqfNntYLL/oBfabfpxD/EZtXjI23FoJ9VTYjTQYIkMQiqtKN/W
         54Xxg4N/xWl8tXjLa2h+bIJa5IY5paElUaOkXjilmMFSx6W5P5i4OZkQVVT+FIVBxpxA
         LjIwOnFEmSJBxRlse1sdotsZcBXvgz7+fTxv0WugLe1xZEuOpjOus1aVbzI6kHTED+Ak
         c7OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m75si3208753ybf.460.2021.02.10.16.33.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 16:33:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9zvc-0006ee-Na
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 19:33:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1l9zvU-0006eT-5a; Wed, 10 Feb 2021 19:33:44 -0500
Received: from mail.csgraf.de ([85.25.223.15]:40582 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1l9zvG-0002W7-M4; Wed, 10 Feb 2021 19:33:43 -0500
Received: from Alexanders-Mac-mini.local (unknown [188.138.100.120])
 by csgraf.de (Postfix) with UTF8SMTPSA id BF83160803CF;
 Thu, 11 Feb 2021 01:33:25 +0100 (CET)
Message-ID: <a3fb4541-a183-9c11-cdea-b7cf88eb8b52@csgraf.de>
Date: Thu, 11 Feb 2021 01:33:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:86.0)
 Gecko/20100101 Thunderbird/86.0
Subject: Re: [PATCH v6 09/11] arm/hvf: Add a WFI handler
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Peter Collingbourne <pcc@google.com>
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-10-agraf@csgraf.de>
 <CAFEAcA_KFzEERYJ9d8YbPjhCv1rt9O9w567xP=ECqixLie5nmQ@mail.gmail.com>
 <CAMn1gO4p4CDH7qVhNnTpOeo_q98iYBHgS2LLSe26q-3SQJX1Xg@mail.gmail.com>
 <CAFEAcA_zNdgAO-1eif_TO7cBD1uB09pbGnbjEhUz+RDX+k9vVA@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA_zNdgAO-1eif_TO7cBD1uB09pbGnbjEhUz+RDX+k9vVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.211,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LfoDw1bQYkbP


On 10.02.21 23:17, Peter Maydell wrote:
> On Wed, 10 Feb 2021 at 20:25, Peter Collingbourne <pcc@google.com> wrote:
>> On Thu, Jan 28, 2021 at 8:25 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>>>> +                if (!seconds && nanos < 2000000) {
>>>> +                    break;
>>>> +                }
>>>> +
>>>> +                struct timespec ts = { seconds, nanos };
>>>> +                hvf_wait_for_ipi(cpu, &ts);
>>>> +            }
>>> Why doesn't the timer timeout manifest as an IPI ? (Put another way,
>>> why is the timer interrupt special?)
>> Timer timeouts result in an IPI (via HV_EXIT_REASON_VTIMER_ACTIVATED)
>> if they become due while in hv_vcpu_run(). But at this point we are
>> not in hv_vcpu_run() (due to the aforementioned difference in wait
>> behavior between x86 and ARM) so we need to "manually" wait for the
>> timer to become due, re-enter the guest, let it exit with
>> HV_EXIT_REASON_VTIMER_ACTIVATED and then trigger the IPI.
> But WFI doesn't just wait for a timer interrupt, it waits for
> any interrupt. So it doesn't seem right that the timer interrupt
> in particular is being handled specially here.


The vtimer is handled by hvf itself and results in a #vmexit when 
triggered. On wfi, we're switching from an hvf owned vtimer to a QEMU 
owned one. The only events that can happen to wake us from wfi are kicks 
(IRQs, maintenance events) or expiry of the vtimer. The select() logic 
in this patch handles both, as it wakes up on an IPI (kick because of 
IRQ/maint event) and exits gracefully after the timer deadline.


Alex


