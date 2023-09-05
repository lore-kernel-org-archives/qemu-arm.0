Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp2100464ejb;
        Tue, 5 Sep 2023 08:51:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYHQUWYqCu7cFbX/IVP4laAZaIuSoaNDhtdXmUT8rk6d4awbwjeWsQI1vPMgrtBXTdmjCV
X-Received: by 2002:a1f:cf05:0:b0:490:e790:a15a with SMTP id f5-20020a1fcf05000000b00490e790a15amr184011vkg.7.1693929104074;
        Tue, 05 Sep 2023 08:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693929104; cv=none;
        d=google.com; s=arc-20160816;
        b=fYExd06/CqSWtSTbb4aCMCY2PUeEIAT8il63KeCuHbgGTDazRJWa9gCr+1AwOn3ebp
         pTnSMhMNRpCMItYfYyQAsWIzu3FhvRaFz+S7dWSTR5Iz17Lley441RxrhIUxU7HSIY7J
         46l4jnhspXpbKYvV8ycVtdn2vhZ9s8E8iRvgA+i8pY0a+zzj88aJoluGWrUxdhm3cwjH
         WsKx0zi8XpzNSgR3SwJRSLLywqFVAmlTxB6avB+HRRtshXbPqxmd0W1EjzIithBLyV74
         5oKkCeFJXOkT0q4qz6Y96pghp4d3Td5OEUjOpjkPurfqlNDIfXMD0s4FUddPnra1N7Hh
         gGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=gsjyXrSASazJSH1qfhm4Cu4pTLOJ+2sbouv1USxHuJ8=;
        fh=O/GvFG3ZLDVqtL43bfo1wUkI4oJFMIsMsmORxjY4dJM=;
        b=YixCl35/G+zLni2JIGhXqW2ryzwylio5z91B1XfckE80YL4ynPV6UgLeEwZtvLZTLO
         Dmi2eq5kWz/haR8klBnGepb2kGNYXtVpLPtTQM+YPJ5LzRrqbCgfYkP0O3wb0Mde98hI
         Vsg7fpiZ05iT+pFrS7sSc8B4FQeHD2m8EHV/2iazTngUrcZ2KwPLpgRjncoSL/0r67/t
         AwhHbjoxB9flMcMO3spCCp0+qYX0PixZ5iYsEGVCA3TFHQnWmBAFUyk5Bps+zM1zCP/a
         DmFNCyFhm3RfMSeyAY/f/5BOZtnEXzJFJwNVUOeHp8HYdt3/OjKXSL/Zr0WGGxDfU1VX
         NV1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Qn1RR09/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14-20020a0cf58e000000b0064b4b380c0csi8185212qvm.150.2023.09.05.08.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Sep 2023 08:51:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Qn1RR09/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdYKl-0001Zk-KJ; Tue, 05 Sep 2023 11:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1qdYKa-0001Wt-1a
 for qemu-arm@nongnu.org; Tue, 05 Sep 2023 11:51:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1qdYKW-0007zz-R6
 for qemu-arm@nongnu.org; Tue, 05 Sep 2023 11:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693929064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gsjyXrSASazJSH1qfhm4Cu4pTLOJ+2sbouv1USxHuJ8=;
 b=Qn1RR09/mCT5eAhgoPlj8P3t+osnEBq4wg0iX7RLUuqER0HtHjuQAJfSfDk6v5khUlBnN1
 3xzulOhBO8avNvL8sirqYZbByO90uiZ1gDqsQGGIa3ChyGFEtOZfBqTSnCVWoRq0Wngt2q
 l6y41T9cjqcJCrwKzNBvNun+uhGkYWk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-XZFL8-C0MwKPMNLDXbhS6w-1; Tue, 05 Sep 2023 11:51:02 -0400
X-MC-Unique: XZFL8-C0MwKPMNLDXbhS6w-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6515b44388fso3924166d6.1
 for <qemu-arm@nongnu.org>; Tue, 05 Sep 2023 08:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693929061; x=1694533861;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gsjyXrSASazJSH1qfhm4Cu4pTLOJ+2sbouv1USxHuJ8=;
 b=mCuPRYYa7q7uHWdBbCJRZvvwm8H7vgG3jccqgriR6Mq60bWGhM8XJeABjps0JXGgtE
 Bu/OFHGzu62/92OUb1HLwr1ODwzShYqC9VAB73wdeLz/5N1vL0NA+h5nHSOpJVDPvQEp
 iv5f0srhraHa/WD8TSNpf3V7VjPJf1U6V45loFnuI8mZSQLPXSeDUjnPwm6OEVabG6UW
 hpeS+LWzDpA+1S3ozOYlz7MkX/o7wumLCDQrAdfh7O2M5nJQDH8JzemtKl1CRxP/QJxO
 CSVL8HHWfoLKs9iGdTe2MnvLWIc75kREZuzSQ4tbvCSiNpSwKx5b/5D5UBG4c9JEuo/L
 QuGQ==
X-Gm-Message-State: AOJu0YyXJYd8iKWzqGjLCHUXtWll84cj2gZ0y43+jpGCkWupkpLZAsud
 dg8DXz/MuVZSnMvVyneytv2SaIyp48o2oy5/Dw+q8eCJA8pv3zfRPxQ1ZrAfs+t0sgTqAmJiIJ0
 QlXPBgwW4xTJp
X-Received: by 2002:a05:6214:f69:b0:649:5f43:245f with SMTP id
 iy9-20020a0562140f6900b006495f43245fmr15094547qvb.6.1693929061454; 
 Tue, 05 Sep 2023 08:51:01 -0700 (PDT)
X-Received: by 2002:a05:6214:f69:b0:649:5f43:245f with SMTP id
 iy9-20020a0562140f6900b006495f43245fmr15094540qvb.6.1693929061221; 
 Tue, 05 Sep 2023 08:51:01 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 j6-20020a0c9cc6000000b0064f72cc5f4csm4612997qvf.11.2023.09.05.08.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 08:51:00 -0700 (PDT)
Date: Tue, 5 Sep 2023 11:50:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH v2 22/22] softmmu/physmem: Clean up local variable
 shadowing
Message-ID: <ZPdOYhOMgMATgQRE@x1n>
References: <20230904161235.84651-1-philmd@linaro.org>
 <20230904161235.84651-23-philmd@linaro.org>
 <ZPYGYgs88/zgOHLc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ZPYGYgs88/zgOHLc@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: DN4mMks2TpXr

On Mon, Sep 04, 2023 at 05:31:30PM +0100, Daniel P. Berrangé wrote:
> On Mon, Sep 04, 2023 at 06:12:34PM +0200, Philippe Mathieu-Daudé wrote:
> > Fix:
> > 
> >   softmmu/physmem.c: In function ‘cpu_physical_memory_snapshot_and_clear_dirty’:
> >   softmmu/physmem.c:916:27: warning: declaration of ‘offset’ shadows a parameter [-Wshadow=compatible-local]
> >     916 |             unsigned long offset = page % DIRTY_MEMORY_BLOCK_SIZE;
> >         |                           ^~~~~~
> >   softmmu/physmem.c:892:31: note: shadowed declaration is here
> >     892 |     (MemoryRegion *mr, hwaddr offset, hwaddr length, unsigned client)
> >         |                        ~~~~~~~^~~~~~
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > ---
> > RFC: Please double-check how 'offset' is used few lines later.
> 
> I don't see an issue - those lines are in an outer scope, so won't
> be accessing the 'offset' you've changed, they'll be the parameter
> instead. If you want to sanity check though, presumably the asm
> dissassembly for this method should be the same before/after this
> change

(and if it didn't do so then it's a bug..)

> 
> > ---
> >  softmmu/physmem.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

