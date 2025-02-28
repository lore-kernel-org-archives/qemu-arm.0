Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1023900njb;
        Fri, 28 Feb 2025 07:59:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFimDAzPK++nBfxy4tushbsEXobg9yAN4u2NHfrvV+XmQK08KhvvSURdq173U+1V66WrLzXqdHIiTMEA==@linaro.org
X-Google-Smtp-Source: AGHT+IG2WAv4tnb7buV1YCoxmBjDJ+w0YYM06C49H+s97TFZzU84Ls/erMIV0CpAzRZ5zrIL9kFK
X-Received: by 2002:ad4:5f07:0:b0:6e6:5caa:e5d with SMTP id 6a1803df08f44-6e8a0c8038dmr57076366d6.4.1740758344904;
        Fri, 28 Feb 2025 07:59:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740758344; cv=none;
        d=google.com; s=arc-20240605;
        b=ViKTMdIwLD4UhRENuV9SFxCw18QeMYaA7/sW9Yb1W3ZBX6V4M+SJdPNY9sE6AvIE/M
         uVQ9PhjsqXudqy2jOSHGsgZ+4y7tsxPcBANxm5T61zBuEB8KruDlw2EjCP5WZobGBagh
         UPm/JRUBFLqruhSLxt5NVIO9i4nwO7mG3G3bGnK98pKQDLh67KWfQuGlBArvo9kBpZta
         ZvFBY79wWNTo5jNaGidRs1TkeP34yF3aQ3hoLgJQ62Lll2WhQAwBMmIhIhpkbJU/DbJE
         g+hLSq0fbC+BFvXVU3IRHpD0Ug/Teymb+7thUoByfV+PxfEzsX5zWPoynJqbhPYym7wE
         2uPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=nHA8ovX/AnL9D5+TISfoctk/YRXX3ujmkQkd7hhpVeo=;
        fh=aJp6FguB1k+1UK3MlBQR3TmJ6V+Ti/upV33RAZmdtII=;
        b=EuFTfxwNleDk3izBh95ua2027DzHI0zqFiMwzsL3XtCKnyMxubUB4UKJxtbU71De0l
         jMsb6RdysCx4Iu1mbO/85nBSMkeQjwVR9tSHoob/H5c1iTxFTv2jEF6hRwlRmRMES8f4
         LaXlZWWvRcDSawRsSmWi3/5IZuyrC7revCapS302Sa7WTX2EPTUMPaMI96qHcKaI6lmc
         P+HCjCgDSMupsjgbkd0fwGhaucciqeg0QGpYLk4GA/oQ9cngLOztmFk9OOgK54BxlNOS
         W4y4h1f5Q95N3MigP2JJRdsczP4Sv5OkTs0mXTwG8QN2Wd00GsWclycI9UM0usAXlj2u
         WTrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xenproject.org header.s=20200302mail header.b=hbuwI5QU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=xenproject.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8975e73d3si33776726d6.62.2025.02.28.07.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 07:59:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xenproject.org header.s=20200302mail header.b=hbuwI5QU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=xenproject.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1to2lK-0004Jm-96; Fri, 28 Feb 2025 10:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony@xenproject.org>)
 id 1to2lH-0004Iq-OX; Fri, 28 Feb 2025 10:58:51 -0500
Received: from mail.xenproject.org ([104.130.215.37])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony@xenproject.org>)
 id 1to2lG-0007Kl-A1; Fri, 28 Feb 2025 10:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=nHA8ovX/AnL9D5+TISfoctk/YRXX3ujmkQkd7hhpVeo=; b=hbuwI5QUNI272RkhIqC2aL50wY
 pgXR1oV4O7Zhl7NuJAUhYW8DgqZtWsJlGIvBG13mfN04t+KNTRcGrhq2sivflsdikOW6+TKBsVOYR
 91e0XwClSD6Uz+mJgmBZOrn26yXXkpyOAhd9/T1zHEJoHnCWCyJ2gLixzkK2DLM03J8Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1to2lE-00AMUu-0c;
 Fri, 28 Feb 2025 15:58:47 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1to2lD-00FOOQ-1z;
 Fri, 28 Feb 2025 15:58:47 +0000
Date: Fri, 28 Feb 2025 16:58:44 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Thomas Huth <thuth@redhat.com>, Jan Beulich <jbeulich@suse.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 7/8] hw/xen/xen-legacy-backend: Remove unused 'net/net.h'
 header
Message-ID: <Z8HdNAgLfa5JE5AN@l14>
References: <20250218162618.46167-1-philmd@linaro.org>
 <20250218162618.46167-8-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218162618.46167-8-philmd@linaro.org>
Received-SPF: pass client-ip=104.130.215.37;
 envelope-from=anthony@xenproject.org; helo=mail.xenproject.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: S6xw6tfQAGXz

On Tue, Feb 18, 2025 at 05:26:17PM +0100, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD
