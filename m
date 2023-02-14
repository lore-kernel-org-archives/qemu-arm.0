Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1546085ejb;
        Tue, 14 Feb 2023 10:56:22 -0800 (PST)
X-Google-Smtp-Source: AK7set8IxrdcyHVP65sdJPYrv3rTjzIr3ktNyel96/4WDMN76QHvKkIdCHVq4qFZgjX+5G9MSoh8
X-Received: by 2002:ad4:4ea4:0:b0:56e:c03b:a7c2 with SMTP id ed4-20020ad44ea4000000b0056ec03ba7c2mr5512991qvb.37.1676400982183;
        Tue, 14 Feb 2023 10:56:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676400982; cv=none;
        d=google.com; s=arc-20160816;
        b=wTQfbSNHssiZ7m4siknAOUoiu3wBy4pPXVifU2Oyq/QwH7DCau6xNWn7VpUpskP0DD
         IJsZftQ5BvKf7GIuF7eH3OAbmjlNQng9xpoFB4DhPNzgRWvKQnQJV8QnfzWiiI905dO2
         K4Q1AFb95FAhcAmGAjicSytBPjX/IaEsBWCaal04t5apNPSX9ph9KmoQ8DKlVbEnNd+2
         68FaDSax5fQlZS2IalHXhU4tVcMElIJPV7CbOkHxKleug7YMhIZy7RpFfsyBAOxsmm8I
         l/UrcHityMYlOgdy61z5E5xf/lN2lQILRDuTxHAvZ9jzYRqYEllvNTPYHdvFipJyz5gN
         CeiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature;
        bh=Ei0cE8YmOm6icxPZYCScEBZZB/m3T1tagcmT+C7A/Es=;
        b=ZRTcfn/vJxu45zm0KbCe5hLTCBKJoJ8ITWVltGKd0ch6bihJ1bge6Ol8J8z9dZPabb
         xcgCztQ7nfCyFQZwU1Bcf6GdqjpMovGWvp3SErJAvpYLFydod5HCwHGPFtKorPYrP4zm
         Ft3Xaj9JbPhGLGJ8PchGSOHWvJNXexOwrkRq/Sr5cDsMWuMHb0E3UMx/jpF1Q031le90
         xq3Ckw5ofmAQEF7DvGiSAEu3431U5FpAH6Vnj9RGsKgSmOeVHPhMbInAvHzOAsDZUDPY
         fUyTKupQ/Y9OC0oYVxs6RZJ6wBmDOBOMjEmEffGlqaaek2uAE+dIzc8E7P5qObFQ87QA
         Sakw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Hhoovoy7;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15-20020a0ce24f000000b0056ed288f898si687589qvl.365.2023.02.14.10.56.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 10:56:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Hhoovoy7;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pS0TF-0002fA-Q6; Tue, 14 Feb 2023 13:56:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pS0TC-0002ei-Ot; Tue, 14 Feb 2023 13:56:02 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pS0TA-0003s8-Lz; Tue, 14 Feb 2023 13:56:02 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CF19A2187C;
 Tue, 14 Feb 2023 18:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676400957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ei0cE8YmOm6icxPZYCScEBZZB/m3T1tagcmT+C7A/Es=;
 b=Hhoovoy7JtVGniq87ioTgOwR+xY1zQw5fciEH+3kmbRVazSjHsxUf6zlhNhitziz372x/p
 raZnvGBBQ2cWYksMyixRrnE5VTGGsrW/TcYgRY1UL/YoYqo12Xp4lvXZjNP4TA6vw7zdx5
 UAKDhsDXDnOjLHCMbIbZo0v7uM17Ylo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676400957;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ei0cE8YmOm6icxPZYCScEBZZB/m3T1tagcmT+C7A/Es=;
 b=KbXag5swwd1q2xPlJACTveFwqBdb1n7NtiyDR1WUCsbGJJYp1WmT30tBjFErSENdZwuhQb
 oeG2aU+RnYpW1rCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56BCF13A21;
 Tue, 14 Feb 2023 18:55:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +fqfCD3Z62OiTAAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 14 Feb 2023 18:55:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: Re: [PATCH 01/14] target/arm: Normalize aarch64 gdbstub get/set
 function names
In-Reply-To: <20230214163048.903964-2-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-2-richard.henderson@linaro.org>
Date: Tue, 14 Feb 2023 15:55:54 -0300
Message-ID: <87h6vokret.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QdHhPEaDxJR0

Richard Henderson <richard.henderson@linaro.org> writes:

> Make the form of the function names between fp and sve the same:
>   - arm_gdb_*_svereg -> aarch64_gdb_*_sve_reg.
>   - aarch64_fpu_gdb_*_reg -> aarch64_gdb_*_fpu_reg.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
