Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2373269ejs;
        Fri, 12 Jan 2024 05:53:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHD5OMYlqXuPJ+mfK4ateXl3mgEsR6xevUEV/A5H+M4OqeesnL2XtgxWMmpCWgt/Q63HDII
X-Received: by 2002:ac8:7fc4:0:b0:428:3f23:5d07 with SMTP id b4-20020ac87fc4000000b004283f235d07mr1314895qtk.106.1705067624609;
        Fri, 12 Jan 2024 05:53:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705067624; cv=none;
        d=google.com; s=arc-20160816;
        b=pf4+SIuf+7b10h6xeyG0ah/eSBa1HhLvRdy7uX/niztrjL9BlZWPSjqntqctWKi0A8
         dF7y/aezABVtYsxSLPngf0Vf+l2aQk8ptLCVqRoD4gdTjZEd46wzOqIHyekzvURdawMP
         xVOed1upgzilwG0XLDzuv6Bu1hPwIwY4wrh+4aOcgQop3r65+KqNHJa7if1+ixjEEaRZ
         CrxK6GAO4bBk4RbmpjeGIfkLJCGe8tgFqshMxHP4/EZ1CBGKkNGv4lO4Pfs9Ed8HxQQr
         Ny6Ovjzj01/HekRgwcCZHiMH1ACAtSsPaDovh6jkch3b+MB6gSJo2DNNgTe2XGrD82cm
         XM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=YLQeK9JPN153qq4oML3PXAtaSLTSsAR4OAWzDWUTomw=;
        fh=nzWOGEZwAN+iSprOOrqT+6Ru49p/bLZIgCNLJCUdTeA=;
        b=JksMzMVfLKxVcal+pQbXg+WXRxCYxjN8gI8wx9yGJrTBwb6qltd965z17J1pLLRQH+
         MuHDzttguFegkdBUMPWkWILflaL26yrKIxjmRuYMSbpiqBkICkUJEr0UlgiCEQW7foRR
         mWYKz85cgGL1RukJoX4fhA8WbWya+QMesnnY0YbIqQ1WUoOxzP57e+HRFgkpD/4QZdhe
         irGbrL59WdHNc350LR9jqw4uT9+CMp//4T4PuljNb/0ZcCsK56nz+NIDzBbKLUvsxHZu
         RneIbPfrvedM7t6M48oKHXOtTXtD19LQHQ8i564WV4po2PikX0lAtJ3Ue1cKcYtidWlO
         LPUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="STHFkOL/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2-20020a05622a190200b00428032714basi2928900qtc.212.2024.01.12.05.53.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jan 2024 05:53:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="STHFkOL/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rOHyY-0005hn-WB; Fri, 12 Jan 2024 08:53:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1rOHyW-0005em-5W
 for qemu-arm@nongnu.org; Fri, 12 Jan 2024 08:53:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1rOHyQ-00015P-PU
 for qemu-arm@nongnu.org; Fri, 12 Jan 2024 08:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705067604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YLQeK9JPN153qq4oML3PXAtaSLTSsAR4OAWzDWUTomw=;
 b=STHFkOL/HAKQAfI5vm/tuCoVtJATAVCsMKO9QyudNliEjV80gpjkqTd/MurQCt7EgTckGs
 SIfQo90F+FN8KZe9CCdBgiULhdV5t/EcOo6klFL9miIO0mofFZ2FfSsTxQkaIWA2928JMV
 G7OX2HSeU86u78jgLTtrB99FHR4m7qE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-496-lfRjC8NOO5ai_dbpu73Hxw-1; Fri,
 12 Jan 2024 08:53:19 -0500
X-MC-Unique: lfRjC8NOO5ai_dbpu73Hxw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36B0D29ABA00;
 Fri, 12 Jan 2024 13:53:19 +0000 (UTC)
Received: from localhost (unknown [10.22.8.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0820492BC6;
 Fri, 12 Jan 2024 13:53:18 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@linaro.org,
 richard.henderson@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH] hw/arm/virt: Consolidate valid CPU types
In-Reply-To: <20240111051054.83304-1-gshan@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy Ross"
References: <20240111051054.83304-1-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 12 Jan 2024 14:53:11 +0100
Message-ID: <875xzyodyw.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.09,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: WCsX0VZeTHii

On Thu, Jan 11 2024, Gavin Shan <gshan@redhat.com> wrote:

> It's found that some of the CPU type names in the array of valid
> CPU types are invalid because their corresponding classes aren't
> registered, as reported by Peter Maydell.
>
> [gshan@gshan build]$ ./qemu-system-arm -machine virt -cpu cortex-a9
> qemu-system-arm: Invalid CPU model: cortex-a9
> The valid models are: cortex-a7, cortex-a15, (null), (null), (null),
> (null), (null), (null), (null), (null), (null), (null), (null), max
>
> Fix it by consolidating the array of valid CPU types. After it's
> applied, we have the following output when TCG is enabled.
>
> [gshan@gshan build]$ ./qemu-system-arm -machine virt -cpu cortex-a9
> qemu-system-arm: Invalid CPU model: cortex-a9
> The valid models are: cortex-a7, cortex-a15, max
>
> [gshan@gshan build]$ ./qemu-system-aarch64 -machine virt -cpu cortex-a9
> qemu-system-aarch64: Invalid CPU model: cortex-a9
> The valid models are: cortex-a7, cortex-a15, cortex-a35, cortex-a55,
> cortex-a72, cortex-a76, cortex-a710, a64fx, neoverse-n1, neoverse-v1,
> neoverse-n2, cortex-a53, cortex-a57, max

Alternatively, we could skip any NULL returns from cpu_model_from_type()
in is_cpu_type_supported(), but I guess leaving out not-provided cpu
types in the first place is cleaner.

>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: fa8c617791 ("hw/arm/virt: Check CPU type in machine_run_board_init()")
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

