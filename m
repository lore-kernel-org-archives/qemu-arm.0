Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985CECDE000
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 12:48:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcjVM-0001si-E9; Thu, 25 Jun 2026 08:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wcjVK-0001sH-RD
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 08:48:26 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wcjVJ-0000SS-BG
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 08:48:26 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-809ee64a490so15732527b3.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 05:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782391704; cv=none;
 d=google.com; s=arc-20260327;
 b=iO+tQOO4SO6sgHiysXbkqsceHQMwLw6S+7Ka9VWViaiBpGzl9/A5THSaPv4GXA4V1i
 24hfNPSeI4BnzGJa9GrroZmmLxY1K/rernIICC7W8JQmO2YBeuG2nsAGIi6o99b4CLej
 0h9bIMnfMfHn00mz92fYDpuaIcb0fOCS2VpSYAPrjgEJ4Zy24wrrwqgg2TYoRgeP9LTS
 B+zzR4ufulf4L6oqUq1qHOyshB2/9AtzPH/8r+rGR6PJM1WEpUJhMIwabR2m2uQ+lFNd
 2HOQfpiQhyidWE6+RKB8S4BXLfutah1Xe7BpqAnMc1QidIHSXAgKfhGOyW5dWIZqmYIr
 PZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=2M8Prvp9m3uVSFa8NYFepSbJtbl5vqEVMu3cpQDBjR4=;
 fh=yvYegwgpNrjdkSXOoBfqb8K3hyPww84GrQJxcghL1FE=;
 b=oPj5hBbh8fhut0Ted4b2gecq1V8tmqJqVj8/5qD+QldVsIYoNmlIrXlg6nMh4NmIn/
 g8PgcHmsECZFT3Ch++T6ustc69v9V/wOEI61lEgHy0216/IX7CGKeEM+AVoFuw6a+REz
 sNalEZW+nDA0nJg/vd2ggQeQpRVtGYh63LSNbKQeE7bt3t0Ny+es3qwBvTKubW3EO70g
 +gaGM7bM02TYjW8absk5QVP2rED8tY3PEbXfLHUoeCzIM80OdsqVfknU8Gr+QAuzuLna
 +XrvdPNenL1tEoa+vlQN3I6ZGufknvDo1y1JLR0lVF0ydN2PuLBtzILIfP+1bKCnHQA+
 pNCg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782391704; x=1782996504; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2M8Prvp9m3uVSFa8NYFepSbJtbl5vqEVMu3cpQDBjR4=;
 b=mPWQlUgAkjFxGFDLC8sN7EnwLyUMpNaqN3HqRpw8yQcxmAfRfEDLxy67GqpEa+ryWO
 EXnc51u0RfzmIGls7LH70ZTrrm1CgrysCEzGLqGiox69ncbllNEJsSe9WPCgdCNhUjaU
 cVL07UZGIDDY4CqodUapdZH2R1DqOPBidq5gjCdhnWEa0Ez3Qvph02ahmfbhh7V5T1aw
 mTVjKGYvms8wUvTz2O/3Z0i/BzPNfiTgqK69kVxs+Of1q1MLNASJgywWMw6eQwtWbHjK
 P09TyhAMoNM3KwlEE4KNcrtv7uvWbf2Nw+H2gSegsvZzsc7HG7Kj9bHdY9Ws1p7Cx65P
 danw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782391704; x=1782996504;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2M8Prvp9m3uVSFa8NYFepSbJtbl5vqEVMu3cpQDBjR4=;
 b=AmoqtpBrp+OBURKbzIStONgx3eNGoE8ilPgGPCQuWdTEHjLrZ4CLkIeTyMPg/8M2TD
 7b9075nFbodm3cFOptrv0y9BPGlHDSgqLigRoLh0n4Ca5cbwF/+d7YIJr+yYw+GmteZ5
 /TmzOayPnxkmJB9uLul06a/0/SOPkFWJjNAXBdkHqXg4OvYCEf32lX+SJqwPw7+FwFUG
 GMKLGQWrF4b02JyLQIXXzuGlrYupXRfcGvSOwCsFdZLKc4UFJ8oTNOx5k5ACGqcqb08q
 P+ds14GeyGgrAIDqUdAvcHUWldexFIFPAPwrukotUQWvHI2IhiYwpfeT/0DoAOvD10D7
 cBDQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr+nFuafgfGEHwpU4r1iInDGcpn69U7qn1n9xORPeWhPHwKd0rmFzDTmsSW6wr+8AOR7NA6UB5aHw==@nongnu.org
X-Gm-Message-State: AOJu0Yycrlx+jB0uwjBi78phjC1dFni45s8PU6vKP0aTuccnOUCqOaks
 Tch78qTIBoWXYJQK6jMOkEU5xlzpXbPBYJGu/jK8fLy7u0XWIZRI5hh6TzKXWPRcnFPLZMB6N/+
 XVGx+xt6kY2ZFTVEemSz5/K9+XdzklRAQalfD22RA3w==
X-Gm-Gg: AfdE7clE0ncE+o7HXBkDN6BaB+IPx6WhPE17bpbmvcKEbZhzM4/CRm3JWWScP9nuotT
 OyNyUPKlnD+sBU2q4tAugEelO0OpLKg7BB++zt54X3sylKEpi7OjmYTfRl8vErdrB3Ltno8Ksbp
 gdixb3p9u23tr9BJX8VEdTMQPMywxv4IO44SEuAmDMpe8iCaTT97VmLYllvAZdT66pKwZlnfK7J
 GOV7Z0QzqvnC09v/8UtvC238ICu+q4gjMX0T3LRdrsFjrRvcJ1saYrboZ1oGIWWWTJOeVcfpnNP
 rAg8AF48LNrHv7unj25235kXJGXj6BbHRm1APGtoiPw+AqZej5GYUEk9
X-Received: by 2002:a05:690e:1343:b0:660:5ce2:58e6 with SMTP id
 956f58d0204a3-66487da95b9mr1771538d50.21.1782391703646; Thu, 25 Jun 2026
 05:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260616052552.389021-1-gshan@redhat.com>
 <20260616052552.389021-2-gshan@redhat.com>
 <CAFEAcA-mf14=jpRFHarAbN6AbQwvW=Yu6WB1JiNMsECEdaxD3A@mail.gmail.com>
 <20260625070551-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260625070551-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2026 13:48:11 +0100
X-Gm-Features: AVVi8CeCovs8jAjvqsIXu3fx-PR-A4o2gQNd6t3Lr2Uz3uu4t4hZRrtwTkB5EkQ
Message-ID: <CAFEAcA8YJZq9TqrUd0zTnewAdVDm5y6UV7BJQZ0C60TZ=RT98Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 peterx@redhat.com, alex@shazbot.org, richard.henderson@linaro.org, 
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com, 
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com, 
 jugraham@redhat.com, liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, 
 shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Thu, 25 Jun 2026 at 12:07, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Jun 25, 2026 at 11:09:26AM +0100, Peter Maydell wrote:
> > This is still wrong. We should not have "x86 magically works
> > and all other hosts do something different" ifdefs. Define what
> > semantics you need and then we can figure out how to
> > implement them.
> >
> > My current thought is that we need to handle accesses of
> > 1, 2, 4 and 8 bytes that are naturally aligned by ensuring that we
> > do exactly one host load/store of that type, and that anything else
> > is "the guest isn't relying on specific semantics here, we can just
> > assume it's plain old RAM and do whatever". That would not
> > require any architecture specific ifdefs.

> Well. X86 is special, as usual. It allows unaligned mmio so
> we really have no way to know an x86 guest does not intend
> just that. That can only be emulated perfectly on x86
> which is sad but I see no reason to actively break it.

What actual hardware will rely on unaligned accesses
appearing to it as single unaligned accesses?

And if we do need this, we need to specify:
- what are the semantics we need to provide?
- what is the use case that relies on these?
Then we can see how closely we can match that.

There's a lot of extra complexity added in here for
something it I don't think is ever going to matter,
and having the most common host architecture take a
totally different codepath from everything else is
a recipe for that other codepath breaking.

-- PMM

