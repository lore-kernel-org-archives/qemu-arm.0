Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1546896ejb;
        Tue, 14 Feb 2023 10:57:33 -0800 (PST)
X-Google-Smtp-Source: AK7set8/ghZUBFAT4SEP0FYCRBKZzgfeHBECkYZmLiJ6DtuORAyXSSxOCpmGF4dW9oDoI/N/FCZ0
X-Received: by 2002:a05:622a:40b:b0:3ae:189c:7455 with SMTP id n11-20020a05622a040b00b003ae189c7455mr5260763qtx.47.1676401052980;
        Tue, 14 Feb 2023 10:57:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676401052; cv=none;
        d=google.com; s=arc-20160816;
        b=NRHKG2k/v2BVv7u3toO+LxByJ7q1WCtLX265joR9cjNnc8cgiRrrmgzpm1oOcbNenQ
         EYu2LfYeMCgY1R4hcze6DU0vAKSlnd8jVjF4blO2HXWtd4+qUChEVx3glfMJCj1WwVfW
         ITA/nw7Jpl5G9Ztkcv4+pwcL9S5WVLEQ8G64EIVSU8Hed2iuIvOJYJK/5CSdFTXMUPso
         QrK+5h8wqswDO9pvznjcWBrYEdPh+nUjTG2RfTkqLG8ahRDo5z8cbyC1rawFMb1C2NNr
         iLBAPPxgnrOnV8Ol/DwVJJy5OotnV1kGc9darcFtA2PXR86Jh+41t8968kDybE1ZnXYs
         4IaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature;
        bh=Xh8q8U51OTjqJ8ndW59AQ6lWCOSUnBSo/ns6ECZcyrk=;
        b=uVKKAV/mA7iDtcDtIqK0+/+4qYIvgKUJVQs63KsTEf0DxNFrjpNUg9ThQ1lrWQeiqt
         lOpqBaVpLjHpRF930sGdAAVJAcl7c8YVLPECA4mXNcWeTox8a4Q+YQ/WQAyAtiHaudXc
         VzcXoZev35J4Ej871qPZW72hYwUewhCSbr7DAjUB89tllq6GCtyvkQOP/ZzeMfHUea9c
         CuD5aFl/pv2qmeOrQU9XlmXhsBiWRSVbzv9bRHQv83UofJA6wTDtmsxzkKX0cyhy7wH6
         iBed7dMWCK5zgX52k6UaUkOT0BmJDbAkYeIv07Zsxt5OzIwQogdPROhFYmb4/fvNHfJH
         UpRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=luguT8iE;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5-20020a05620a288500b0071b56f043a5si11809355qkp.163.2023.02.14.10.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 10:57:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=luguT8iE;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pS0UL-0003RB-56; Tue, 14 Feb 2023 13:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pS0UI-0003Qi-QX; Tue, 14 Feb 2023 13:57:10 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pS0UH-0005ge-9E; Tue, 14 Feb 2023 13:57:10 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9F83A2187C;
 Tue, 14 Feb 2023 18:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676401027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xh8q8U51OTjqJ8ndW59AQ6lWCOSUnBSo/ns6ECZcyrk=;
 b=luguT8iEAXV2xizX2vN6fhUkYRjsDo0HeNBegiRu0LcGTPeQ18uLjynlUg63PRToGBKHUz
 i67ZBiF/9X81rMhwZNM6oEu+KK+L0znGR6khxZvY/xJNoQhacFz4NbDJGilydTM/oASnyO
 wiVmm+e0OMxoIUNwvb/4SMRd9/AkFMI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676401027;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xh8q8U51OTjqJ8ndW59AQ6lWCOSUnBSo/ns6ECZcyrk=;
 b=onwdZsO8bZgMowP8xbUTrm980x9dfHgS8I1amO96NtnqYfuvsBqcLqOvZqKkylSzDyGVdS
 42tmB0ELZAvBy5Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 126F813A21;
 Tue, 14 Feb 2023 18:57:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gNrsMoLZ62MRTQAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 14 Feb 2023 18:57:06 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: Re: [PATCH 02/14] target/arm: Unexport arm_gen_dynamic_sysreg_xml
In-Reply-To: <20230214163048.903964-3-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-3-richard.henderson@linaro.org>
Date: Tue, 14 Feb 2023 15:57:04 -0300
Message-ID: <87edqskrcv.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
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
X-TUID: 4MmlLIqreA5b

Richard Henderson <richard.henderson@linaro.org> writes:

> This function is not used outside gdbstub.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
