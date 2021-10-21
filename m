Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp153723lfc;
        Thu, 21 Oct 2021 03:24:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwujJTb3nsQvluMvQ2Q7+ms20Kj4pnc7NSxg4fqRJb6R7IdcPIaqk0xX86Rot7YCnxlP+zn
X-Received: by 2002:a4a:e788:: with SMTP id x8mr3622137oov.75.1634811881935;
        Thu, 21 Oct 2021 03:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634811881; cv=none;
        d=google.com; s=arc-20160816;
        b=aidmb6TH1HILSisjF5n2usS1ApPNOOyIs/K+LrOVMQmfnV2W4mUM4VDVN9yg/OFHmv
         8S7Q9lEIHlewSoe/URRCaCuKkjJcj30/GRAE08wGkYMYPXZ7Qu71BsvHK30IKKJJOl54
         ntQ2I3PM98/EBxYt1UFO1c7ATGIdvZXeGvSehkca2+fr1DH12O+5vqaMhu/1xQuoCMuY
         /Tf3EwoQTG+muwquHcMHgNeoNjSK/2KDwWF3sdrfLgfXerniab1qPxxjU+BzHzHmRn6E
         nYrhDbS00XWHnH3znlroSTx2icxyjTvESKIIU+DkUDTY7fPb0MV7GCM77WR0Aum7TFgE
         5mlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=YiT4X5hX7kVWEyz2SBVYkhemgExrmGSsTusju05GhHI=;
        b=oQJy9OeQTETkxxrHVzhKKJwhF37mGBlVaho8JdR3MrT+pUFO/pno6oRp4e9HAUvRFq
         hH0OkFaoy8kuopo1Z0P8oqFJEBQ8mZNNRaxfNWxExh4BOkFL+86qSUUzTNtzcezHV7No
         /N+me++0do6mZWYWfM19q+LMmS7ywvUB/ZRM9wf1nImOgfazow77Vulkx/bu8Ibeo/12
         Jf9TtRmmxBM1feKs5bbmvutvMpMXrwBey/3fMSirMVmY3KQngTNZ45UJj0pTxVE/sFqN
         nr1TpB90mB6XoYrnGrt9fTNcj8Cw730dM78KhsvvAgrGLU1hXSxJ0m+uqs01OFxbm6CI
         HUhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=R6G3eHLo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si4562607otn.86.2021.10.21.03.24.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 03:24:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=R6G3eHLo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdVFZ-0008MR-5Z
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 06:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mdVBv-00038o-TX
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 06:20:56 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:40481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mdVBq-0002bn-Dh
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 06:20:55 -0400
Received: by mail-lf1-x12c.google.com with SMTP id y15so309166lfk.7
 for <qemu-arm@nongnu.org>; Thu, 21 Oct 2021 03:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=YiT4X5hX7kVWEyz2SBVYkhemgExrmGSsTusju05GhHI=;
 b=R6G3eHLo+hDJJxurviEatnU6zk2mK4ywZFSQWQecRYKQUkSD4v7OSF1L85IVSAQUTH
 0NCItsqUSRUykoSuDGRKo2T7vIq1vuQqSDdJbKirTy+j+7/Su2JtUAwUyWHciJmGXh35
 UpR1HUXtghOJv8xkT6hT624R1bL/QnN4RQBhUiCr5Hivw10n+yQeGRiTurhCoudrB0c8
 dTF4tT6hmHNTEf4TTPCswPTsHXOcZ2bxTMLWX3oRwtKmztFoukgCoh5EBXX2vBNZrxzS
 1Axw1Pu+fFMO/SiX910SG3+SI5QWbN0jw3jXf1OQ9ox6/cu+/DP9c8O9RfObiLqH08O1
 b/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YiT4X5hX7kVWEyz2SBVYkhemgExrmGSsTusju05GhHI=;
 b=RZgqZiI6TtPqMxndWEoRLAjTOPmqxEV+hORAfLHBarv+B7YKsIcOLNUeCx2ghLJV0S
 Iu7slT/Dqr2GsWy9Xz2sFKPdw81C72BBX+ANr3kdrYmIsXxuhwRmXRoxeo/8FAwXtKWZ
 BtFqE2LH19ADzUjZlZ7WBYRXxFDV0R4uKBSjuR+eIP28HlhUoaMSV2++uJozMF3KJVli
 DoYaVsDmVMJUhqFPOUEC7w5cRcfFEfzN+VWxvgBqPjyPXJA75TiNAwWgYKcjddLvy/4s
 xHxydnv3klOLegEYczxWU32M92JGF4+yDDdWAHj6/PaFRa7/pbKDtF1qwyJDJpXg6uTY
 faFw==
X-Gm-Message-State: AOAM533+3WOM6gIUAdHRhn29chRcGNn3+8w0zqNlSorplFOM4QYINx+1
 /1OHc0FBxG1IkT9TRqKe+T7G6sk4Z1ljo57R1+Dd02IEB58=
X-Received: by 2002:a05:6512:31d3:: with SMTP id
 j19mr4378668lfe.337.1634811645618; 
 Thu, 21 Oct 2021 03:20:45 -0700 (PDT)
MIME-Version: 1.0
From: Janne Karhunen <janne.karhunen@gmail.com>
Date: Thu, 21 Oct 2021 13:20:34 +0300
Message-ID: <CAE=NcrYD56r9hWk7y_7nuvpLtFm9d37s=xFtHPYgE7e2JF6ybA@mail.gmail.com>
Subject: system emulation with kvm guests inside
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=janne.karhunen@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g1NFVnrh7bik

Hi,

I'm working on a hypervisor that unmaps the kvm guests from the host
memory, among other things a bit different from the regular KVM.
Overall it seems to run and the security is improving daily
(https://github.com/jkrh/kvms). Hopefully next week we'll merge a new
research feature where we make the MMU run backwards for pretty funny
use cases.

That said, what's the status of the TCG system emulation if the KVM
guests are executed in it? While it does work for me, it works even
too well at times and allows access to mappings it really should not
per the second level page tables. Is this to be expected or are we
looking at a bug in the qemu softmmu or our code? If this is to work
correctly and there are no shortcuts in the QEMU when it does
(especially) virtio in such cases I suppose I need to dig into the
issue in the emulation a bit deeper.

Btw the 'mmu' debug option doesn't seem to do much these days. Is
there any other way to get output from the softmmu / tlb state on
arm64?


--
Janne
