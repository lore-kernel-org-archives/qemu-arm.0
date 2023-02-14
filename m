Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1575180ejb;
        Tue, 14 Feb 2023 11:35:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+wSy7nsiVEx3zOixTfxJ5/jI2NN+Hud12rlW43SKwyp0CnEKEtL+9ybJhNlVf8KwR61hlz
X-Received: by 2002:ac8:5e0a:0:b0:3b8:61df:e298 with SMTP id h10-20020ac85e0a000000b003b861dfe298mr6179264qtx.3.1676403350031;
        Tue, 14 Feb 2023 11:35:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676403350; cv=none;
        d=google.com; s=arc-20160816;
        b=NuDabzv3Xxyzy39aPQLl0fT3+uZgdEgIYUcoczdQ1eYqMbyJu96+jrmgyKSnIrLOaB
         5AZIlt2NwfyDbUJ/XovIFw0g+We3ng2Qzm0xKua7FchI+dIe8BGIMrXgL+lp+LTJsKRI
         vbfd7A1nhlMATT6UnkXZsUC7rtYghOFPt4HugvpukEtAxu75mOKhmJjfDo4cEhofvaTD
         2WcrMQXiu8gA90hPTicB0igNY2T8hFGWWsnlhA/tjjf6OR7IcaGo7KFDPQ65pbyo8Ti7
         g+zJxq5h+pKjamC5/XBUf3600wbICv13qFYcrCYfB13z1pK+H1C/OCqYO0H8fMzCKwre
         c5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature;
        bh=315MVkyXBbcj47zGKGPbsShBhxUqZSvmA9smoxU0dbM=;
        b=GJVXOEJ1bw/dVpdVVS1yHHFBhJVY84LDSJW/E48lFAA0maR+WI6VDmbcdDoq0zSOpa
         jidSgIYAxFN9MPAhkQexPcxMW6uHoXModh4uMIbMT8/5VwBQyaTbz4qi72kSlF08lWyG
         JLYPMdb2Edjiv1Ayu3Me92iUZUMhXohYLsc1ZAul11v9rK8AfW1fA9wd9uMyObwWVJTX
         DiIX4teKykclqUHxODViY/HwVcWmILX2h2JDf+eSXkzci4/Ddbw9FuXg/4U0mnYBtGri
         B0qbTkhMrLxn+4NXJ0nFAd3eDOhkLJ8vSvvJ1kqksE6Ap9AxAI6UIpYYyCsr1X9u8pod
         7SGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=iDkQsd8L;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=3L0RiFt9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020ac85b0e000000b003b9b4475908si11877829qtw.237.2023.02.14.11.35.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 11:35:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=iDkQsd8L;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=3L0RiFt9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS15c-0003Cy-8h; Tue, 14 Feb 2023 14:35:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pS15S-0002ux-Tr; Tue, 14 Feb 2023 14:35:35 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pS15Q-00014t-Vc; Tue, 14 Feb 2023 14:35:34 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A952B218A0;
 Tue, 14 Feb 2023 19:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676403328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=315MVkyXBbcj47zGKGPbsShBhxUqZSvmA9smoxU0dbM=;
 b=iDkQsd8LQgB1M8un6ys3TXzagoaADJ8nz30Do3ZqBD1qp3cY40enHrTMPddrF2nrQoRtKU
 Mac5I4rKJHNt7o6/cCWYQO1aiYbYW0dmepNB9cak5j+R9dRjHyaom8VFUUUrYNBHpzdPc2
 4U5EKKKa3lgGmCzxG4pC3N4q+mtlzTk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676403328;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=315MVkyXBbcj47zGKGPbsShBhxUqZSvmA9smoxU0dbM=;
 b=3L0RiFt92HtlevrR2T8Q3+rpbWX5d85KG7c1v7kNQtbsdc6arMGHl79G7mWXRgUQdjAdZ+
 ndrDr2hjXICHslAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2BA4613A21;
 Tue, 14 Feb 2023 19:35:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oX1YOH/i62MfWwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 14 Feb 2023 19:35:27 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: Re: [PATCH 04/14] target/arm: Split out output_vector_union_type
In-Reply-To: <20230214163048.903964-5-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-5-richard.henderson@linaro.org>
Date: Tue, 14 Feb 2023 16:35:25 -0300
Message-ID: <878rh0kpky.fsf@suse.de>
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
X-TUID: 2JJgFIMm9Ous

Richard Henderson <richard.henderson@linaro.org> writes:

> Create a subroutine for creating the union of unions
> of the various type sizes that a vector may contain.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
