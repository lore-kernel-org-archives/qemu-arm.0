Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp419341lfm;
        Fri, 26 Jun 2020 06:00:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqzzXnYKWij9mfqaNF0KfLh6KAgPFoVEMS8hpHQ3SG0lFafNtty/1jyT3YKX2IKAPEEx+q
X-Received: by 2002:a0c:d444:: with SMTP id r4mr2985761qvh.67.1593176403405;
        Fri, 26 Jun 2020 06:00:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593176403; cv=none;
        d=google.com; s=arc-20160816;
        b=vkmt8vlVIH2603Ox5bgPrH0hiYaFW+48XvviPWcPVtvx2fCAspC6o3/nDE1WmLGCdu
         9H86cBfPc1QKvbIv3/0hYd38n1nJHArVrumSWxt6bO2LQvHhdf2ccfAlJfm+FogKOFgs
         fRsnbWx76RNs8crbW4XaHkG81EJnoMXWW/PzVywhingsN90Tf2dJyRQazT5B0q8b48BI
         9lMaGwtAPixOa5difCiWj9aya4mI/EkW20tc4T9I/PR/5q9tuW+gZqNwrSNXQSJMqfAv
         +9uKDWmeju4qjgEbx7KRObuIkAoJHMV8TvlRFq4FkZYlpoWJ+ddoNQowIxlvDC2EWRHx
         sPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MbjOfvUhk3JHZJQI4+QZtqfzsY724TpWCAh9bXBzgB4=;
        b=b3d/kRdkMJ2a8jFh+m6uuhbvAFuHMs/W3Qpf8JUt0FpMarjrwMTGeILLZnIKLPrBkE
         HpUUpQse6C2WAbw9x7CECEwjEMsOUSmqB+K1jvH1tT0enEjB1HaQ7B/i32IdIksUew39
         rPGsIapvRlWupy6bSJUaT2DjMcY17FVYS1Yl9m5wu/ZipZTykmoqmmqQBSYj4QA3JPla
         SaaKKPIppWPAxGJnPY4GaGdEiF3SseYHSFvc8JFrgwKtcxZo3aW1tKXepnNbJbs+oK1L
         7zbXUHIBB1BG+ZOn44ITXkS6V+XJaPl3PcNip9Dsd7y3u2NpH1Q2L181rNvVLHS6r66G
         eZVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b="Vfzaao/u";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id j9si14141876qtb.304.2020.06.26.06.00.03;
        Fri, 26 Jun 2020 06:00:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b="Vfzaao/u";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 0856A4B1D8;
	Fri, 26 Jun 2020 09:00:03 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLhYe+bKCtKf; Fri, 26 Jun 2020 09:00:02 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id F1A084B1D3;
	Fri, 26 Jun 2020 09:00:01 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id B918B4B135
 for <kvmarm@lists.cs.columbia.edu>; Fri, 26 Jun 2020 09:00:00 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YaYZC75I9X2c for <kvmarm@lists.cs.columbia.edu>;
 Fri, 26 Jun 2020 08:59:59 -0400 (EDT)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id D70214B114
 for <kvmarm@lists.cs.columbia.edu>; Fri, 26 Jun 2020 08:59:59 -0400 (EDT)
Received: by mail-oi1-f196.google.com with SMTP id k4so7984603oik.2
 for <kvmarm@lists.cs.columbia.edu>; Fri, 26 Jun 2020 05:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ka0oIQYu+5hhSwRJltqEXo4HJnZK2e5WXM5WZG7JEZ8=;
 b=Vfzaao/uT44wP7JQQ1HUEopzlxRDTsfA/lgWLklhGJ1EzSieoOZtrUPBWpBjgq0kjZ
 b5uU/DPsWjuToJCs20CyFJG/L4J5jBmhrKnjx4wDaRkY1wQY1uMvyDlPF6qOUjyu9LGr
 qwiALLpWJyKSUtkO0dzU0Ki9rQ4C27pxFnM7RzjkjJZ9bCj5CLb3xv5eiqpCEpbbHU3y
 DKo9ruGYHTTgT8lDKfUhG2AOyPG8TzqLlL9yKJ5BLCM3pqK1I/xVTlaFBZgF66bkhywR
 YvZc89NGEHdM/mFeI8ZCih87d18NxW7UXRS6zYvJESqQbIof+436h2+U04vi/YJj6HMN
 OrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ka0oIQYu+5hhSwRJltqEXo4HJnZK2e5WXM5WZG7JEZ8=;
 b=W20K4wRXP3Ac8bT5X9iZysQJOAKeWbdKUtkKEVx4BZmMwYMzviaILO9XVNRHTZodk2
 7w7y7NRpRip2PSMzaEUXeSP3ZRF06H6Ja2mR9EAlwH5bZYS1S1Xb4XzOp3qw10/TVk3w
 q4sW0lLmjRjJpy0DYKF7eFR+irnjBGShw540TRp+Vgk8/vDC8uUvTDr8q4eneNvVylPs
 m+h81wIJ9gA2GKP9WAmrTikEL/XinMsxx8omIJSaJ+vjkMu7M4FdKjhoeNLc1NUJGRO8
 tsTzSycVoa5x8bFbfKKgM58CJ6ca+cygmf8NcuxOZR/ZTV3iNpHHN0AsfpPauSs5TOUa
 +gUQ==
X-Gm-Message-State: AOAM533ZqJP5ndREWiAW5sCOQHCxOXMjryzTy4IOGLfsQaQkNwYQ0fdf
 VIr8kJOIgUCy7sgVoGE7j3kxbt7D4XbQUUHli/2KOw==
X-Received: by 2002:a54:4694:: with SMTP id k20mr2186547oic.146.1593176399314; 
 Fri, 26 Jun 2020 05:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200625220336.10186-1-beata.michalska@linaro.org>
 <20200625220336.10186-2-beata.michalska@linaro.org>
 <20200626090050.3sqsukopwydv43od@kamzik.brq.redhat.com>
In-Reply-To: <20200626090050.3sqsukopwydv43od@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 13:59:48 +0100
Message-ID: <CAFEAcA_pKMkwAGAAdkCXk3dOqJQnX+qRsZuLMWA0qfMsw+aF1Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] target/arm: kvm: Handle DABT with no valid ISS
To: Andrew Jones <drjones@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: AVVEKvG6ClQI

On Fri, 26 Jun 2020 at 10:01, Andrew Jones <drjones@redhat.com> wrote:
> nit: How about using '= {0}' when declaring the variable, rather than this
> memset?

We prefer "= {}" -- although "= {0}" is the C standard approved
version, some compiler versions produce spurious warnings for
it in some situations. (cf commit 039d4e3df0049bdd8f9).

thanks
-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
