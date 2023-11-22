Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp143683ejx;
        Tue, 21 Nov 2023 23:36:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ3wi3yXUhFdNT63bLGW1IkP0RFTy9UBql12TA2cX839rdRL5YE2dc7vI0x2WGnf1VsBiY
X-Received: by 2002:a05:620a:628e:b0:77d:5daf:90df with SMTP id ov14-20020a05620a628e00b0077d5daf90dfmr1578420qkn.51.1700638618914;
        Tue, 21 Nov 2023 23:36:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700638618; cv=none;
        d=google.com; s=arc-20160816;
        b=l6MwPJeCeqnhQcQVPUvMdRI8I+SayiQG0eA+aUVNdfGpzRNS3E089bt/jcVgZAudf9
         Lz/snHsid3KZcCmo3TlKhZuElXlfZrhuICDb9G0mbLmdZjlHeXROIf45qLeZNfqF+vlU
         jTmJr8VuPD7nFBero3yEBSmRdpSz+23jhdx3oGHdnNOBMuQJE8eR3cjdTeYusDYJgIRM
         gPAZm/edVdgElW42lz/EP2b9BP4FW9XNcPfW267FkU5KPFJhwLWbgrgmsmVWn2HGutoE
         TbTvG0KDexW5m9quujZGQsS8XX++J2DY7oJiTTx0G/XDmXaXPHKgp9ibzFMOGP+8TLAC
         epeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=heh+k4/ZBsoYVeDKOiMmdTEQKR9cVd8tuPwq4kKh4gg=;
        fh=A6d4BJTkcO4Tb4V34rr2mSX3341RstIj7VsNiQUca0w=;
        b=oxhVSQMvFZgXALTDK7MtVj/tYYTu1T04qm3MZAONxMqwKeUg4mjvR85qRA+f7FntAt
         5+Nq3Kk3/OJtdE1M0e78poYyPsjmbH49jZ8NJQWbM5IYm3xmDgKHF1nW5oAQPcKfpTIZ
         QyW7nkj7HIWolEIZpDnH6ru+7TOB/pF+hSjw75Zf98y2yQX9lKDEzinpkrV9tnEXpUD2
         y8mZxWvA50xeynEwY2WRWKsUG9zk6xk3Q0ZxvomPzBXx2fa2PAvExB76CY+5TdjstTt3
         X7yRNkJ68ANh8iFuuQw+2qTyDKgbLAOgdLSQuC3xurT6CmWjs6nM3egJE6orG+4T3c61
         /HIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U+BFUGAS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ea5-20020a05620a488500b00773be513ec2si11662002qkb.738.2023.11.21.23.36.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 23:36:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U+BFUGAS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5hmt-0004kl-96; Wed, 22 Nov 2023 02:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hmp-0004i4-80
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:36:40 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hmj-0002sR-9n
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:36:37 -0500
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c6b30aca06so79613261fa.3
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 23:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700638591; x=1701243391; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=heh+k4/ZBsoYVeDKOiMmdTEQKR9cVd8tuPwq4kKh4gg=;
 b=U+BFUGASSaotWMch+ue/90IPM0JLpis7a0Shs1HBQ/+mfEGPA5gR7EO5/ZzeyGRP9B
 +xhNa/5nNoQlSNTjhzXuFDIasNFJjpwdhO1z/VIgcRt/mrWaRZ7MoHuelnOBYG1O/YM0
 io2aW+cD4t8IvKEE+x0XByzhECdgNI3A6SVI6y8pdn5BToPzHkuxMsHBOV6GqNe6uUvQ
 5JSno99mWStSPPBi8FQxuMZccBKcw8HoZ/gPd2IrrIdVdxXbsVM1LlGWjstoCreD70sZ
 Xc7O+n5lbHh0y0hpEEBOmzysqPmGSJaAsv31CdE2W5CODeXJmoqVRE6Ksuf/Y76+/4t7
 igzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700638591; x=1701243391;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=heh+k4/ZBsoYVeDKOiMmdTEQKR9cVd8tuPwq4kKh4gg=;
 b=WxIpCaQrmhaPrJFA5fDy0c5WW2rjVfI9c+8ZfimgBgioiLvJxDy1brefoUn4NOKi5e
 Wmivt4LqvnMVRl+oUPRy99M/LOrdoHlaK1rEUd/Xh6w8tGBnqAWOTQxTpa3xhYmuyjuX
 ZOZrqHcsb66lvkizOaBFmP8s28Mey0xuqYpJef1a9N44R93Ez0e7dFqLv6aUANRONfIA
 ghX8f5gTxduaqjh3tbycg7EZ6f3c5sDdBO6ff/vVDgdmDGyeQHyFeOYBAaxc1nipSmDt
 9ab2PJ0qvSs+hGu3RCmxClLZBmY+GDUnuwwambeUla9Vz2CaM4BXScgWMDArb+lSENjt
 Gh5Q==
X-Gm-Message-State: AOJu0YwJcwtQeSo3vlodvwSTTyxACv6Rdvewvlkvp3nrJ5R8YPMfuLLv
 2ry8701Xy0roOGgxXoDUApCExud+ceF2AEZwTb9WDQ==
X-Received: by 2002:a2e:991a:0:b0:2bb:b01a:9226 with SMTP id
 v26-20020a2e991a000000b002bbb01a9226mr881290lji.7.1700638590760; 
 Tue, 21 Nov 2023 23:36:30 -0800 (PST)
Received: from meli.delivery (adsl-27.37.6.163.tellas.gr. [37.6.163.27])
 by smtp.gmail.com with ESMTPSA id
 3-20020a05600c234300b00405c33a9a12sm2063384wmq.0.2023.11.21.23.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 23:36:30 -0800 (PST)
Date: Wed, 22 Nov 2023 09:32:26 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-arm@nongnu.org,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 C=?UTF-8?B?w6k=?= dric Le Goater <clg@kaod.org>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Bcc: 
Subject: Re: [PATCH-for-9.0 17/25] backends: Reduce variable scope in
 host_memory_backend_memory_complete
User-Agent: meli 0.8.2
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-18-philmd@linaro.org>
In-Reply-To: <20231120213301.24349-18-philmd@linaro.org>
Message-ID: <4il4s.ev85gnoc1wow@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: xPk/3u7yDusl

On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Reduce the &local_err variable use and remove the 'out:' label.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> backends/hostmem.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/backends/hostmem.c b/backends/hostmem.c
>index 3f8eb936d7..1b0043a0d9 100644
>--- a/backends/hostmem.c
>+++ b/backends/hostmem.c
>@@ -324,7 +324,6 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
> {
>     HostMemoryBackend *backend = MEMORY_BACKEND(uc);
>     HostMemoryBackendClass *bc = MEMORY_BACKEND_GET_CLASS(uc);
>-    Error *local_err = NULL;
>     void *ptr;
>     uint64_t sz;
> 
>@@ -400,15 +399,16 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
>      * specified NUMA policy in place.
>      */
>     if (backend->prealloc) {
>+        Error *local_err = NULL;
>+
>         qemu_prealloc_mem(memory_region_get_fd(&backend->mr), ptr, sz,
>                           backend->prealloc_threads,
>                           backend->prealloc_context, &local_err);
>         if (local_err) {
>-            goto out;
>+            error_propagate(errp, local_err);
>+            return;
>         }
>     }
>-out:
>-    error_propagate(errp, local_err);
> }
> 
> static bool
>-- 

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>


