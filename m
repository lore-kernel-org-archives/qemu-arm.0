Received: by 10.25.21.156 with SMTP id 28csp1134943lfv;
        Thu, 4 Aug 2016 01:13:31 -0700 (PDT)
X-Received: by 10.55.77.11 with SMTP id a11mr4984141qkb.35.1470298411478;
        Thu, 04 Aug 2016 01:13:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b67si3310896qkf.119.2016.08.04.01.13.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Aug 2016 01:13:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38365 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVDmU-0004cG-Qd
	for alex.bennee@linaro.org; Thu, 04 Aug 2016 04:13:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1bVDmQ-0004be-Oa
	for qemu-arm@nongnu.org; Thu, 04 Aug 2016 04:13:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1bVDmM-0002UD-Th
	for qemu-arm@nongnu.org; Thu, 04 Aug 2016 04:13:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55343)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1bVDmM-0002Sz-MH
	for qemu-arm@nongnu.org; Thu, 04 Aug 2016 04:13:22 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
	u7489YYA119829
	for <qemu-arm@nongnu.org>; Thu, 4 Aug 2016 04:13:20 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
	by mx0a-001b2d01.pphosted.com with ESMTP id 24kngchjfu-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Thu, 04 Aug 2016 04:13:20 -0400
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Thu, 4 Aug 2016 09:13:17 +0100
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 4 Aug 2016 09:13:15 +0100
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: cornelia.huck@de.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org;qemu-ppc@nongnu.org
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8F1AF17D805F; 
	Thu,  4 Aug 2016 09:14:51 +0100 (BST)
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com
	[9.149.37.212])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u748DEfu23921106; Thu, 4 Aug 2016 08:13:14 GMT
Received: from d06av01.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u748DEqp011924; Thu, 4 Aug 2016 02:13:14 -0600
Received: from gondolin (dyn-9-152-224-112.boeblingen.de.ibm.com
	[9.152.224.112])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u748DEl4011896; Thu, 4 Aug 2016 02:13:14 -0600
Date: Thu, 4 Aug 2016 10:13:13 +0200
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
In-Reply-To: <1470241360-3574-4-git-send-email-berrange@redhat.com>
References: <1470241360-3574-1-git-send-email-berrange@redhat.com>
	<1470241360-3574-4-git-send-email-berrange@redhat.com>
Organization: IBM Deutschland Research & Development GmbH Vorsitzende des
	Aufsichtsrats: Martina Koederitz
	=?UTF-8?B?R2VzY2jDpGZ0c2bDvGhydW5nOg==?=
	Dirk Wittkopp Sitz der Gesellschaft: =?UTF-8?B?QsO2Ymxpbmdlbg==?=
	Registergericht: Amtsgericht Stuttgart, HRB 243294
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16080408-0028-0000-0000-000001FA93CE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16080408-0029-0000-0000-00001FD16C60
Message-Id: <20160804101313.3ed44f42.cornelia.huck@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-04_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
	definitions=main-1608040092
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-arm] [PATCH 3/5] sclpconsole: remove bogus check for
 -EAGAIN
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
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Amit Shah <amit.shah@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ajP+6PJX0T/O

On Wed,  3 Aug 2016 17:22:38 +0100
"Daniel P. Berrange" <berrange@redhat.com> wrote:

s/sclpconsole/sclpconsolelm/ in the subject, as there are two sclp
consoles :)

> The write_console_data() method in sclpconsole-lm.c checks
> whether the return value of qemu_chr_fe_write() has the
> value of -EAGAIN and if so then increments the buffer offset
> by the value of EAGAIN. Fortunately qemu_chr_fe_write() will
> never return EAGAIN directly, rather it returns -1 with
> errno set to EAGAIN, so this broken code path was not
> reachable. The behaviour on EAGAIN was stil bad though,
> causing the write_console_data() to busy_wait repeatedly
> calling qemu_chr_fe_write() with no sleep between iters.
> 
> Just remove all this loop logic and replace with a call
> to qemu_chr_fe_write_all().
> 
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  hw/char/sclpconsole-lm.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/char/sclpconsole-lm.c b/hw/char/sclpconsole-lm.c
> index a22ad8d..8cb0026 100644
> --- a/hw/char/sclpconsole-lm.c
> +++ b/hw/char/sclpconsole-lm.c
> @@ -201,21 +201,9 @@ static int write_console_data(SCLPEvent *event, const uint8_t *buf, int len)
>          return len;
>      }
> 
> -    buf_offset = buf;
> -    while (len > 0) {
> -        ret = qemu_chr_fe_write(scon->chr, buf, len);
> -        if (ret == 0) {
> -            /* a pty doesn't seem to be connected - no error */
> -            len = 0;
> -        } else if (ret == -EAGAIN || (ret > 0 && ret < len)) {
> -            len -= ret;
> -            buf_offset += ret;
> -        } else {
> -            len = 0;
> -        }
> -    }
> -
> -    return ret;
> +    /* XXX this blocks entire thread. Rewrite to use
> +     * qemu_chr_fe_write and background I/O callbacks */
> +    return qemu_chr_fe_write_all(scon->chr, buf, len);

This is basically the same change that had been done for the sclp vt220
console already in 2e14211 ("s390/sclpconsole: handle char layer busy
conditions"), so this looks fine.

>  }
> 
>  static int process_mdb(SCLPEvent *event, MDBO *mdbo)

Acked-by: Cornelia Huck <cornelia.huck@de.ibm.com>

