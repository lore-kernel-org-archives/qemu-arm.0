Received: by 10.28.91.67 with SMTP id p64csp1644607wmb;
        Thu, 1 Mar 2018 02:06:15 -0800 (PST)
X-Google-Smtp-Source: AG47ELsbfGazhInRJObrOjsnuclHfz+QvIDSDoopOp3oYLBxV7l8Bdvp4xUL4NhiBfTYNxvI0rmt
X-Received: by 10.55.43.220 with SMTP id r89mr1903912qkr.152.1519898774933;
        Thu, 01 Mar 2018 02:06:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519898774; cv=none;
        d=google.com; s=arc-20160816;
        b=j4aE55iz0IW7rDC4FW7vcKtrDp4+F7QvD7ZKaZveSMlZtLGHp1Gwx1sW6pnacG6ZPQ
         tjc+bZccinX5xotFyaZAphWkGMI8VxaOpOWMkXagpdBQDC4QCaBW1zcLaxlQByUEdWk3
         c7J6JIeJGweG5Imtjnj/2xhZdq1wKacH1MsNPdMnmKJH6XM5y3OPJIZDrqD340eiuG1A
         OhthooEoRdN2qMJnJj709WVn6m4FPkQcwrXgExrkNs/Yq7HdD+jYqgbs2lsG479uJoUz
         EOizwQa1ikdj5lSlYH8mQLhljbZkV6GQ/fgwTHWKmz1hdntgVjXLGTLqdaEy8AlB6ySI
         i1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc:to
         :subject:message-id:date:from:references:in-reply-to:mime-version
         :dkim-signature:arc-authentication-results;
        bh=g2v8Un81JQsy4UwTf5D8NX4edfRkpemuA5HG8/k4+7M=;
        b=hfqhDySSCj6wwx9Q+jAzMaeSCd+8xlZtP2onxAtCYUmgckXCTWEzJ+4bCGsbtwtfTU
         99LDLfSkRPsPO6OlEqRg3eGNVMOyeeFn08cxGwlWt6R7mZpwcX0ISb502/G8uCcGg8WT
         KiXoDc/nPiLbv73KkrX9IkhSIcRAA96Lf0hUzyX5L9PZ53s0dKEGtIbD2KkHhnfAeirU
         JymgyYNJnU3GZFBRYSxzxHyHOG56ANUE4ADTWsSYGVAWe3tjWE+iEGNBSETb5GHyDfGX
         kc7HAVMjH0UC8e/ioZ/0Uv52//loM62a10rHtr+bBd/inD7lSOyKg4OP/wm/i3HmfUhC
         lMrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=gVm9EPXw;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id m34si4116602qtc.121.2018.03.01.02.06.14;
        Thu, 01 Mar 2018 02:06:14 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=gVm9EPXw;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 15DEE49E05;
	Thu,  1 Mar 2018 04:59:16 -0500 (EST)
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
	with ESMTP id f1PezcDAgl7r; Thu,  1 Mar 2018 04:58:54 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 8937849E00;
	Thu,  1 Mar 2018 04:58:54 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 6DB9842121
 for <kvmarm@lists.cs.columbia.edu>; Thu,  1 Mar 2018 04:58:53 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4kVJeb60c1my for <kvmarm@lists.cs.columbia.edu>;
 Thu,  1 Mar 2018 04:58:32 -0500 (EST)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
 [209.85.218.53])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 5964549E00
 for <kvmarm@lists.cs.columbia.edu>; Thu,  1 Mar 2018 04:58:32 -0500 (EST)
Received: by mail-oi0-f53.google.com with SMTP id c18so4046606oiy.9
 for <kvmarm@lists.cs.columbia.edu>; Thu, 01 Mar 2018 02:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=NF5arrQn3GhJ91uMzJJs+0y/dHJkR3Tfai150KZ0N7w=;
 b=gVm9EPXwBCDFCoMd/K1EX+w8lxiXI4bF25+G8S31w0XYfMU9HwrpILNN0HlRFlASCh
 mBpk/y3sTuueRU0DI25ATMeEe8fO5u43ceWCfYnLkt8A16b03G0cgYBsRjRA3axI+L3r
 ddUiDE4Wf4FNABT9ctIAGV5bLDzuZPAGCDfHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=NF5arrQn3GhJ91uMzJJs+0y/dHJkR3Tfai150KZ0N7w=;
 b=rQbp9qVaNGyfqP0W+vukyUEN33XW4TdooNWT++/2pxB1PUdsxaP+DId/IzvUd+O/Y/
 U7oQdWLhY9sBSbcywCDzTRasyVnhZiJqOJzqbP/CuVmstPDh5WqOGALSbKZfY6hGhG6w
 Pk6/6yAjjJMJ3YtWs0bhBcPaKjZotY62BnwIdDm5HTZ6mGhUZaplbmgovZm/jStQJOKm
 9VY4LAcHbDjzbXce2KrmO9GfXHYojA7J/JdnpJHkhpZR1FtKhSpTD+s8JfsroNyv3B/U
 +tIZcW1i7a6iBF/7/Yt+SipWozDCO/Fk0XdGss1YrN5C0y2pEJFjKckzeG9F6e2zjm/i
 RkYQ==
X-Gm-Message-State: AElRT7HtNgAq6SlcWi/grJmMrusElMDB+eZhBLFufRkh478Ek8VZvOJ7
 oHVXJG3JYotkyUdEjtiCnf9HslcrZNmcmqNWYgJ1uA==
X-Received: by 10.202.17.13 with SMTP id 13mr710121oir.164.1519898730211; Thu,
 01 Mar 2018 02:05:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 02:05:09 -0800 (PST)
In-Reply-To: <20180301105030.2b716e68@redhat.com>
References: <000e01d3afad$b9a13830$2ce3a890$@codeaurora.org>
 <20180227104708.GA11391@cbox>
 <ac329e1b1f5265a805916ab4f8708f9d@codeaurora.org>
 <20180227124604.GA2373@cbox>
 <20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
 <20180301105030.2b716e68@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 10:05:09 +0000
Message-ID: <CAFEAcA9yaU745Asy--jM0nu8FDJ62CEXSH_TKa-ZZfC16qye6w@mail.gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] VCPU hotplug on KVM/ARM
To: Igor Mammedov <imammedo@redhat.com>
Cc: Christoffer Dall <cdall@cs.columbia.edu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christoffer Dall <christofferdall@christofferdall.dk>,
 qemu-arm <qemu-arm@nongnu.org>, kvmarm@lists.cs.columbia.edu
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
X-TUID: 9+Re4IDKYY8u

On 1 March 2018 at 09:50, Igor Mammedov <imammedo@redhat.com> wrote:
> In QEMU on x86 (and I think ppc, s390 as well), we create vCPUs on demand.
>
> It would be nice if ARM would be able to do that too,
> so that it could take advantage of the same code.

It's not clear to me how that would work, given that for
instance the interrupt controller wants to know up-front
how many CPUs it has to deal with.

thanks
-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
