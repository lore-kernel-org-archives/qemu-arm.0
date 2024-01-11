Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1787521ejs;
        Thu, 11 Jan 2024 07:41:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbbS+A+mU63n4wIrslTgJGHqkbOlPJ3/6rh1zpdlhWNZUWlvYOv5yq4SM9Mnf1bFFpnctU
X-Received: by 2002:a0d:ebc8:0:b0:5f4:1540:48b8 with SMTP id u191-20020a0debc8000000b005f4154048b8mr923107ywe.4.1704987690399;
        Thu, 11 Jan 2024 07:41:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704987690; cv=none;
        d=google.com; s=arc-20160816;
        b=dAMCeb1H+2rM1Ltx6Yih6/j30mnmD+U/DYnhf4ry5R8yd2pHanzsICdoy3lJ+6ixOw
         xz8IB2Gi60z/4gZ77KCXAnZQsFpRAELn8Ab/f+JiCVfiUZ1dDr4Fnjrgi+lXDWCsHVE4
         8vJusTIp2utM+L2+LJnir7/3rYgYfWK85gFAIk3m3x1URZShfZuTJtzc0K4D4nk73JDN
         yY/8nDK+fG30/KIcBgDa28wlAv4A0HzrfSbOz62GGkbYY+1bxkai1ZVEf0P4I7D+sSCk
         /k6et3rgQbIXVlIpXmpXm4dREkCUKMz7B7m/x2qO48o0jywbPRG5s2ozYHRXRoTrqEvA
         3TUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=iEz7sPILT/HMrC7NOzt7pd9/3qFxaGBIjK04DG6KQo8=;
        fh=Qhc/Z+4AqHwUeknErqy3gwtb3GElk3CHv/+pURptbrc=;
        b=F/WVjT4hZfOm5XxR5ApfWFCEBwDs4Pt+hwjsHL+SiIQ7yXo08HGpy8e426Q7xlOOcr
         +g3pB3FK5Zw3ZPgz1tZP35hG3CCq3m8oGUbW3yrzfDRjl8gSt3X3IUlqtzMXDUcg0VSQ
         lQKLxryubGQDCNwETilk0wqhawnhWkHCXU9xuYmUBUEzsL/gihMPkloP6n0ZLOPgvPFs
         LBjhvs58GPuQ3Zn6yAG+9l8YZkxOwBxrgJ9euWCCacdKQAjC40XmdJhuqnNhWj5y+d7w
         oKv9kRb9gy2RrYkFGssxexkiwZCWHmHCTjCmim8xXbVDE3oNlS9LstcMGI6ESgCtsOfm
         0cgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WpRC2Xph;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17-20020a0cf191000000b00680642bcdb3si977038qvl.590.2024.01.11.07.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jan 2024 07:41:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WpRC2Xph;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNxBE-0005DL-OM; Thu, 11 Jan 2024 10:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rNxBC-0005CQ-S9
 for qemu-arm@nongnu.org; Thu, 11 Jan 2024 10:41:14 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rNxBB-0005t5-4S
 for qemu-arm@nongnu.org; Thu, 11 Jan 2024 10:41:14 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5534dcfdd61so9688818a12.0
 for <qemu-arm@nongnu.org>; Thu, 11 Jan 2024 07:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704987671; x=1705592471; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iEz7sPILT/HMrC7NOzt7pd9/3qFxaGBIjK04DG6KQo8=;
 b=WpRC2Xph05dC0SMDf8VLXWWeTVUeVw4bZGKbizFFUYWTpzcg3Sny6ig9g+iffbojiD
 M44QOzF24iZMsGBS1sqMVs1GrjPgJlLHAVaFQ6XZkO9E3cqj2gYrKbrNPQGuyrd40rg1
 GND0vLw5HW6WqUM7GjLX7rJSCq34H2onB3PQjkueewIFxqxuZdXXQBk1R4CG6H0HaRj4
 5aK5rtLM3IdINls5zwm5Hu0L77EjboC+7u2zBRyx/G1LYuO6puiR46pZ3uQD18nTIsc1
 2yfu/pFzMVDabBuLVg6DCyOAZ2z6BFgzThNRvAKc9V7l8T8FloT9EpjiZofzL845UUKd
 NGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704987671; x=1705592471;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iEz7sPILT/HMrC7NOzt7pd9/3qFxaGBIjK04DG6KQo8=;
 b=Rrw4fEYW233wCH8QcPTN2buKjPtRLIZNLo2RiPOMDCz2rHUkVdFzMcukK8nSlj8dEK
 SSOWc1nbWdJDm+d51caiZ5LD8lIAxMPDuhlkpyTJMm/YbLlcGGk5cS4j7SNnyYdpcCRm
 l6kL1rVUZ6AGe1srNyPJiDdyIII1z1VnPjFhAXu9yp9tIzjqrGyNxUCWsV6+jgVPV0OB
 DlKM48u1ng8BumlPKkM/+Q8ncwU/2qWmDai5Dae/SEXuOaUhfnZK0qIWzJ3fRCxQb3D9
 qoyQkcpWTb6VbFMnkW5aGScXj9COoc8FU5UB6TWl0qVdQhONRWQTPWRRqHzlPzBoukWT
 E34A==
X-Gm-Message-State: AOJu0YygRt9WuxwnjvEs+CUhnszyhxZ5qGtfY8CmlWd22N2ipzS2o1Ji
 7sw03Ji299fycU+qEU/tOt+VPuXpckY0B2edAteOLxczv4Iwzg==
X-Received: by 2002:a05:6402:34c6:b0:557:de62:4be0 with SMTP id
 w6-20020a05640234c600b00557de624be0mr10621edc.28.1704987671033; Thu, 11 Jan
 2024 07:41:11 -0800 (PST)
MIME-Version: 1.0
References: <20230721104437.1199866-1-gshan@redhat.com>
 <CAFEAcA9Sr=eE6PNR7e4jnGVj65wnFgDfbUTHpm+PzSU_5Fy+HQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9Sr=eE6PNR7e4jnGVj65wnFgDfbUTHpm+PzSU_5Fy+HQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jan 2024 15:41:00 +0000
Message-ID: <CAFEAcA-8aTiMNr1op_DDMcZmT+FLyQb7mV0YEh4Eq_DsG73rsw@mail.gmail.com>
Subject: Re: [PATCH] numa: Skip invalidation of cluster and NUMA node boundary
 for qtest
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com, 
 imammedo@redhat.com, pbonzini@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IKwckA0TOPvc

On Fri, 21 Jul 2023 at 12:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 21 Jul 2023 at 11:44, Gavin Shan <gshan@redhat.com> wrote:
> >
> > There are warning messages printed from tests/qtest/numa-test.c,
> > to complain the CPU cluster and NUMA node boundary is broken. Since
> > the broken boundary is expected, we don't want to see the warning
> > messages.
> >
> >   # cd /home/gavin/sandbox/qemu.main/build
> >   # MALLOC_PERTURB_=255 QTEST_QEMU_BINARY=./qemu-system-aarch64           \
> >     G_TEST_DBUS_DAEMON=../tests/dbus-vmstate-daemon.sh                    \
> >     QTEST_QEMU_IMG=./qemu-img                                             \
> >     QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon \
> >     tests/qtest/numa-test --tap -k
> >       :
> >     qemu-system-aarch64: warning: CPU-0 and CPU-4 in socket-0-cluster-0   \
> >     have been associated with node-0 and node-1 respectively.             \
> >     It can cause OSes like Linux to misbehave
> >       :
> >
> > Skip the invalidation of CPU cluster and NUMA node boundary when
> > qtest is enabled, to avoid the warning messages.
> >
> > Fixes: a494fdb715 ("numa: Validate cluster and NUMA node boundary if required")
> > Signed-off-by: Gavin Shan <gshan@redhat.com>
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Looks like this got lost last year. I'm going to pick it up and
apply it since the warnings it suppresses are still in the
test output.

thanks
-- PMM
