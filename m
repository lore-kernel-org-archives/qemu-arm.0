Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1487375ejc;
        Fri, 13 Oct 2023 05:59:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSQXrBbVvCUxAoqkWeB2aQ6S+hMtWVSGRIWyfipK+2YAlNfvSYy87ZEv/RVA37huPagUE8
X-Received: by 2002:ac8:5b0c:0:b0:419:4e1c:68fd with SMTP id m12-20020ac85b0c000000b004194e1c68fdmr33256839qtw.6.1697201985052;
        Fri, 13 Oct 2023 05:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697201985; cv=none;
        d=google.com; s=arc-20160816;
        b=jzJsByXLBzuA7N8Sad7j0boolQ6HEpvUWbTdTiNDheIsK4Np3ctzz3D7mJlFnv5Fb+
         ECvGCNWSCrMtXft6eL7DoXOh8HPT1i1SLUOZUeAEIkyG5AWqSbuzswCPir9gUhgHhN5W
         MO6NxUy54FmOIJCCqNBK1kLOwxZypR61zNHN3fSO/CMTiKasG23oV/f8jYFUxtdino/l
         02YX1VC/AbqbxlDfgcnzGr7gd6TZ5TOh896ILBo8+YHT4l+Pjf5fGVxQn9Pzl9ti6Lnb
         2W9IXM7M5E5q8I4Ewhxf5FC/6FSHfBC5xPZymt1P+EwNBH4g/a/5EQA6fv4pr/ZWbLsC
         4L6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=Z58jaEGr4DgxiYzRz1RUdDOZApDr880Y7wrVhmUzCXk=;
        fh=DOAgBEo2YEuvE0SOEqadusETnPi1LxoqWMVmcnzRiSY=;
        b=gMDR8QoqVw+vHddTK3Mb1/r4z4Ox+lxElUGIsaCqHHiApxsrR9Z+gvrT9MwnJmDtG+
         g3Kx+f6soM5mHLgqKaB7GZIA0WGzpz8FHmkIciRXt6v0yDpbwSFfJLNZxtMocUcbRew6
         lQ4Sk688YI1Oxj3KUvQ/YzKgACdLhAZDhGMvNZlXR0pvNLkJpPOy2f0pR40PXRNe78Mb
         EgnFAqkEBzpPoOix4kj82iIGkI/0J8oS/ZBIg64o26zlS++rnKVYT44XTCX9PfaQ8T4P
         QC1ecWcwmV0qRNxr6+R4uH0PGnowVgCEcIf+GNEvRTH07/0uQ9/8H6aLJKBHpM+qjz5T
         6y5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ixGYVapP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16-20020ac87f10000000b00418142e801csi1152366qtk.485.2023.10.13.05.59.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 05:59:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ixGYVapP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrHlO-0000PA-Ay; Fri, 13 Oct 2023 08:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrHlM-0000OU-3c
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 08:59:32 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrHlK-00036p-7U
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 08:59:31 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4054f790190so23847925e9.2
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 05:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697201968; x=1697806768; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Z58jaEGr4DgxiYzRz1RUdDOZApDr880Y7wrVhmUzCXk=;
 b=ixGYVapPKpa/4qWUyscwM+ZoBqJipCuWFIiQCmGnkNdISwhWkAj5Nd6wA9eiwpHJW1
 xfxQsLn/t3EkNucjmwG9iIp/8e4OqgRP8WUbPHBX6PI8hCSEvCq4g6dzzxz5/UkdoND+
 CyrJ26e0lQHlFwJrdmfChse6+iSOg7jmackqClk2/CqeXMHbBaDr2NJUzxOJLY1evtUs
 XJ7lNXfGQYMQgq9Ri3xLlU3RWnVhPKSVfwatJAqkQSt2lIFCyTtRyqMo7SFPaEJkI20X
 ljrEC/99+ZX7dg6fUENi4HPPIP1t1s6jcVmwDnTNjdqP5dQ2QWZieoe9Sda4Mdm/dkWX
 Gffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697201968; x=1697806768;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z58jaEGr4DgxiYzRz1RUdDOZApDr880Y7wrVhmUzCXk=;
 b=IGyK5OLo1j7LXl5wxswRaYiBtIM8wXbUhUqr9/h/fW32yhXkb9Omo0UFTPLo0VI4Sm
 CTaugIQ51AyklIYEHbMRDOboroon+5ql5cgKlxH1WfPBT8xhQfchZrb26783w+fN/xKi
 fkTLcucug1uZwq4VGfUWOnBIHAKIUJ370od4FkfneKWxeIkSMIIiFckUSL7VSJe5KD7o
 M24Tx0hod6uzbxmbsYhy+hwPiVvXoKZbfKbXw0z//p4FihE0MNQQhMGmSsmu6sxI8bIx
 S1ZSDfDiOjLa9KbFJx4e0+Dov+UmJE0WqaMUpTKQskHLl9K7r6KmhjsqTwVW6ZJhU5Ql
 ZJkw==
X-Gm-Message-State: AOJu0Yyt4uNkr5AquPKGFOUU7sPv2UN4KlHsRxtzM+Pdt6TSbLOB9w6m
 eUR8xi5GBqlRYx7QfYs45M8xYg==
X-Received: by 2002:a05:600c:2298:b0:406:4573:81d2 with SMTP id
 24-20020a05600c229800b00406457381d2mr22546234wmf.39.1697201968417; 
 Fri, 13 Oct 2023 05:59:28 -0700 (PDT)
Received: from meli.delivery (adsl-26.37.6.0.tellas.gr. [37.6.0.26])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c458800b004064cd71aa8sm62302wmo.34.2023.10.13.05.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 05:59:28 -0700 (PDT)
Date: Fri, 13 Oct 2023 15:51:22 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: "Daniel P. Berrang=?UTF-8?B?w6k=?= " <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org
Bcc: 
Subject: Re: [RFC PATCH 00/78] Strict disable implicit fallthrough
User-Agent: meli 0.8.2
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
 <ZSj8YEc0ARdUqFLG@redhat.com>
In-Reply-To: <ZSj8YEc0ARdUqFLG@redhat.com>
Message-ID: <2gxf2.nr1cq95buqhq@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: zbFNSG7cRqMW

On Fri, 13 Oct 2023 11:14, "Daniel P. Berrangé" <berrange@redhat.com> wrote:
>On Fri, Oct 13, 2023 at 10:47:04AM +0300, Emmanouil Pitsidianakis wrote:
>> 
>> Main questions this RFC poses
>> =============================
>> 
>> - Is this change desirable and net-positive.
>
>Yes, IMHO it is worth standardizing on use of the attribute. The allowed
>use of comments was a nice thing by the compiler for coping with pre-existing
>code, but using the attribute is best long term for a consistent style.
>
>> - Should the `fallthrough;` pseudo-keyword be defined like in the Linux
>>   kernel, or use glib's G_GNUC_FALLTHROUGH, or keep the already existing
>>   QEMU_FALLTHROUGH macro.
>
>As a general rule, if glib provides functionality we aim o use that
>and not reinvent the wheel. IOW, we should just use G_GNUC_FALLTHROUGH.

I agree. My reasoning was:

- The reinvented wheel is only an attribute and not a big bunch of NIH 
  code
- The macro def in glib depends on the glib version you use
- G_GNUC_FALLTHROUGH looks kind of abrasive to my eye, while 
  `fallthrough` blends in with other switch keywords like break.
- C23 standardises fallthrough. We might not ever support C23 but it's 
  good to be consistent with standards and other, larger projects (linux 
  kernel).

I think these (except for myself finding G_GNUC_FALLTHROUGH ugly) make a 
strong case for not using the glib macro, personally. I'd be interested 
to know if there is a counterpoint to it: because I don't want this 
change to cause problems in the future.


Manos
