Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2932241ejs;
        Sat, 13 Jan 2024 04:28:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWZUDECCR8vd3MhMctxnfPM8q/1F+P5k7amAKVcpqJVPYlTZnRbhUyUIAX7GVSTM7yw2a8
X-Received: by 2002:a05:620a:b16:b0:783:48c1:7895 with SMTP id t22-20020a05620a0b1600b0078348c17895mr2723255qkg.136.1705148893658;
        Sat, 13 Jan 2024 04:28:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705148893; cv=none;
        d=google.com; s=arc-20160816;
        b=V8c4seMtFJ1ycBSKnsAyFtbKC6yeVfHiqt9Pj5QWcJIMhKuB6rwPmSXy6T6V6/dgDb
         atoshNs560Xy8s3bWbZhpuEIIh4ffeKarpCJUoXMP89zhSqr36SfF7MdkapbM4rk8ycc
         zu8HX7USWms5irRWDLbBdXudmvcmIEVmdCclcGsuv8fkS/DTowBfd1UaR06wq7imxX3a
         o+AFcB8pF/GcWTVTZ1gB/wK1uDw8GayPQ/Sj8xZygcHPNr7rUdf7onqaI5hf0uVGE6rm
         /3RA9vC6OjK7hPAgTvQYkPK6Rm/e5+vbb8HAU2DV05OMe6n3F+28rNmlRH/e/SpcJlxw
         a44Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wQkvjjqEDryM8k31V5oCQZcQEZE6V6uCpYZQ0hg+PFY=;
        fh=okBdXp2j7ZzUTSUTpGCvfl98J3L9zXWlzkZsOlQF4t8=;
        b=JkMei5vpgumS9RTU9dy/5xp43vAgoqQrZ/0xxtpkjQPOjb2Stg7wGOcMWyotxFkvOO
         vN31CrulCgarkVeGsZvuFcLjJOBr8C8rzLDDYqZQqg7FZIc6ZD3FfVE1qD8ADWlT/9qG
         0aOW/QvcZzY9h5znGfgBl39DhB0JIPQ51/AI8f34+5h+Opfs3boWI8EK3MHgZ70VvhH2
         92S23xCc9ckQNQENeYNzWeV1uFtbApHmQf1nXnqlFOoAvSEJcpOVZwptKw5P3KINiqIP
         +PO7it3TJ0rAGkEMRpkUc45ctNh0W3wUcUSpluR8bVvMEA82YbOZi4U0ykyCHlTnY5AO
         5GTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qd/WZ9T9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w20-20020a05620a0e9400b0078328b2f7b3si4908500qkm.23.2024.01.13.04.28.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jan 2024 04:28:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qd/WZ9T9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rOd79-0000vv-33; Sat, 13 Jan 2024 07:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOd76-0000vW-AT
 for qemu-arm@nongnu.org; Sat, 13 Jan 2024 07:27:48 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOd74-0007hu-Ni
 for qemu-arm@nongnu.org; Sat, 13 Jan 2024 07:27:48 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-554fe147ddeso8152453a12.3
 for <qemu-arm@nongnu.org>; Sat, 13 Jan 2024 04:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705148864; x=1705753664; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wQkvjjqEDryM8k31V5oCQZcQEZE6V6uCpYZQ0hg+PFY=;
 b=qd/WZ9T9b+RmqV1rTgR0hKPcJFTnjnNXsegcfw3Rrotws/awDP125WMD+mb8tI9j5r
 7Rh5YlYztDPRMjevexCOgxcuh1WGeulxJCnMCQ+JgaFgnMI3puH4VQ8yu1JK3jLHK55y
 1vZWjWnIARcEc1xwubD/iS1jP3+JjNGPV0I3PJd9iKsIa/28fXOW33WBjN23/kty4NwR
 vd6ZmQV8wHGrbCGRG5gmjnwQV8BrWoJwqORO+1LXOtSt7tsqCmgHeA69HB+pchRTKQ6Z
 pibfYT7Qm5E9TnSfEs4g9f/TOWxoRusVwFKyc5xlEmdrmLlQeafIBFfoMKNgN4HyGjDa
 hgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705148864; x=1705753664;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wQkvjjqEDryM8k31V5oCQZcQEZE6V6uCpYZQ0hg+PFY=;
 b=GNpE8scqFB8KxvWsXnCxbGHO9FEMuXcxywM8/3hwGAikNvFYMJtgT7WPxYK+NwPj4H
 Z6cdd/48lKOxADzrp03p/eBySVJIYLbbovfoug6IMZUoKifvPftAadeWFuTWEm5tY+EI
 Ktv8+uBOsdVg+FWgh47zhr0oy0nZWjriRndkP8EiBeBViyfEz/TZ+GqjdUVFR2IhAJ+B
 WX2i7Qv4OAu6juiq5YLghifj+BO5lERytO5baI3mLUxdF7Nb/pSlla7HP1On0vCYGV+b
 LHXXzSvN9wOjlZZGD3887/I4XAsWy3wGL613JtuJSuUKSLz0UpLPPeryUZPIY9a5KKrC
 MSew==
X-Gm-Message-State: AOJu0YztqS1hw7jP9FKHEcZSJERMm8RKwW8kxmr3w9ACy0ldJZOCTdJB
 zCpwcLE3qmhWMMXtfrMS5/vqOXX0KrZyeL7M7Yb4zS23x0zIUw==
X-Received: by 2002:aa7:cad3:0:b0:557:a8da:7dca with SMTP id
 l19-20020aa7cad3000000b00557a8da7dcamr745791edt.36.1705148864381; Sat, 13 Jan
 2024 04:27:44 -0800 (PST)
MIME-Version: 1.0
References: <20240110234232.4116804-1-nabihestefan@google.com>
In-Reply-To: <20240110234232.4116804-1-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Jan 2024 12:27:11 +0000
Message-ID: <CAFEAcA-2U=8nQH85tQQOPebDbpWuxsQ9_XdSSbiaR1Z8oNZ3PQ@mail.gmail.com>
Subject: Re: [PATCH v12 00/10] Implementation of NPI Mailbox and GMAC
 Networking Module
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: Oa6DKhrLmXlG

On Wed, 10 Jan 2024 at 23:42, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Nabih Estefan Diaz <nabihestefan@google.com>
>
> [Changes since v11]
> Was running into error syncing into master. It seemed to be related to a
> hash problem introduced in patchset 10 (unrelated to the macOS build
> issue). carried the patches from v9 (before the syncing problem) and
> added the fixes from patchsets 10 and 11 to remove the hash error.
>

I found some more issues with this which I've noted in the
individual patches: in particular the patchset is supposed
to compile after every patch, and to get that to happen
a few sections of code needed to be in different patches.
There were also a couple of other niggles.

However, since the fixes were minor, I have made them myself
in applying this series to target-arm.next, to save you having
to do yet another respin.

Thanks for this contribution to QEMU.

-- PMM
