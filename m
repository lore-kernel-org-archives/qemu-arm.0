Received: by 10.25.208.137 with SMTP id h131csp2557678lfg;
        Wed, 18 May 2016 10:55:49 -0700 (PDT)
X-Received: by 10.55.148.130 with SMTP id w124mr9695356qkd.203.1463594149569;
        Wed, 18 May 2016 10:55:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p190si7783058qkb.284.2016.05.18.10.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 May 2016 10:55:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46356 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b35hF-00037P-0j
	for alex.bennee@linaro.org; Wed, 18 May 2016 13:55:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1b35ff-00021k-LX
	for qemu-arm@nongnu.org; Wed, 18 May 2016 13:54:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1b35fe-0003VO-Of
	for qemu-arm@nongnu.org; Wed, 18 May 2016 13:54:11 -0400
Received: from mail-qg0-x241.google.com ([2607:f8b0:400d:c04::241]:35166)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1b35fa-0003Um-PL; Wed, 18 May 2016 13:54:06 -0400
Received: by mail-qg0-x241.google.com with SMTP id b14so4817388qge.2;
	Wed, 18 May 2016 10:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=yrJu7TXWcStt7Gn0pWKnzPotHaIbKEz2NNGAnC+2/BA=;
	b=eVRXCxQXFYnXvvRW16cq4iI8E681UumL7L93lnX56KdHWe7Qzr6KPs5xVn3HXio60q
	KegQv17Ho4udTgchVgZan9wyjLqLO4CulY5hfN74lStqkbTnnYATDrNvODgVMdhGVf7m
	pTU2xyAvq8ASMzHqX4LqJ9knAbKA/TSCd7sJAaiweCfGWzOOMDA5sKGhG/6I7GcM7W60
	JU8pFKalMnPBoaYchM+MJZvy01Sq+8KbTC+W3PiaYh5HTdF2iHgrjPS9kcmQmchkH5l2
	96d11LQVtYdX5Pvho2+nXShTgFoY4T2GG5LQIFx4fjlSZ4sykkUfQosOkC0Qcaaggbrv
	1ewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=yrJu7TXWcStt7Gn0pWKnzPotHaIbKEz2NNGAnC+2/BA=;
	b=k9mmkEXLVE016D3VvVH3LjkOLbGNMZFXi0xzp9rZ/PWlsZomLcZTwF4zoffccanISc
	VBC0PHXkYwzzKiqInWPEH9C4L4fGorT69gwXne5wHS8w8lW0SIkE5OutdmOaylgX0eTV
	J+vdqwKRCOMO8qJHkVSHmTkX+3HTvwSoffau9bQQceNOEEDZDsOf/m+EyFfoinnYWgoF
	dydt2EXM3MSpAMIeHMMgyuY0iNGTsGRDpT+mx/3rCDiV3JPLqdCspJHCUhjK+V9qNAhe
	L40/186qjxBcfuo8FwKFqLrMPNy/Iwr3Je7C1u7QmfJ9LaVZXRUXYs8kITjKZHDRIM1v
	MTXQ==
X-Gm-Message-State: AOPr4FWWE24uOJ4tqxR5FZQ9Uvfly6634Q1m6r68fyowACz8g0h/pcXi+c3E6qFJQMmMhg==
X-Received: by 10.140.139.138 with SMTP id 132mr3835536qhl.34.1463594046272;
	Wed, 18 May 2016 10:54:06 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by smtp.googlemail.com with ESMTPSA id
	b99sm4690557qge.22.2016.05.18.10.54.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2016 10:54:05 -0700 (PDT)
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
	qemu-devel@nongnu.org
References: <146356846293.898.1638185578856249296.stgit@fimbulvetr.bsc.es>
	<146356846834.898.6742213749357910213.stgit@fimbulvetr.bsc.es>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <d186c9d7-d19e-dfcb-0a0f-08d2d79ff2ca@twiddle.net>
Date: Wed, 18 May 2016 10:54:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <146356846834.898.6742213749357910213.stgit@fimbulvetr.bsc.es>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::241
Subject: Re: [Qemu-arm] [PATCH v3 1/2] exec: [tcg] Track which vCPU is
 performing translation and execution
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Leon Alrae <leon.alrae@imgtec.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M3mAxF13fnAe

On 05/18/2016 03:47 AM, Lluís Vilanova wrote:
> Information is tracked inside the TCGContext structure, and later used
> by tracing events with the 'tcg' and 'vcpu' properties.
> 
> The 'cpu' field is used to check tracing of translation-time
> events ("*_trans"). The 'tcg_env' field is used to pass it to
> execution-time events ("*_exec").
> 
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
