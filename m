Received: by 10.80.166.35 with SMTP id d32csp874506edc;
        Tue, 18 Oct 2016 01:49:17 -0700 (PDT)
X-Received: by 10.55.192.24 with SMTP id o24mr1728674qki.3.1476780557488;
        Tue, 18 Oct 2016 01:49:17 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b139si20270153qka.131.2016.10.18.01.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 01:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:39690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwQ5E-0007SK-Vu
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 04:49:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bwQ42-000785-LD
	for qemu-devel@nongnu.org; Tue, 18 Oct 2016 04:48:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bwQ3y-00049H-Ia
	for qemu-devel@nongnu.org; Tue, 18 Oct 2016 04:48:02 -0400
Received: from mail-db5eur01on0139.outbound.protection.outlook.com
	([104.47.2.139]:58944
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcin.krzeminski@nokia.com>)
	id 1bwQ3y-000479-0q; Tue, 18 Oct 2016 04:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rJGN4oVYuVX2S5d28vV12soyYPHHLEd3I0/ye6tnFA4=;
	b=n9S1Z9BGU1EJpmGOmLhUFz5/7lqTjmCiv1S/yGPKcdcoHZHNYyBAdv/ti605hSQIrcTEo+M4SOPUaq17V5uRdJvH7eOlgMx4sDC6B7maWwxFdDcGtURi1X90rAnLU4KOd+xDvrCFMQyOMT9Hh0XH1aP/L+dv3HwUlkKGcmBeCS0=
Received: from VI1PR0701CA0044.eurprd07.prod.outlook.com (10.173.77.30) by
	AM5PR0701MB2626.eurprd07.prod.outlook.com (10.173.92.145) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.669.5; Tue, 18 Oct 2016 06:14:52 +0000
Received: from AM1FFO11OLC003.protection.gbl (2a01:111:f400:7e00::199) by
	VI1PR0701CA0044.outlook.office365.com (2603:10a6:800:90::30) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.679.5 via
	Frontend Transport; Tue, 18 Oct 2016 06:14:52 +0000
Authentication-Results: spf=pass (sender IP is 131.228.2.241)
	smtp.mailfrom=nokia.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
	131.228.2.241 as permitted sender) receiver=protection.outlook.com;
	client-ip=131.228.2.241; helo=fihe3nok0735.emea.nsn-net.net;
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.241) by
	AM1FFO11OLC003.mail.protection.outlook.com (10.174.65.78) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.669.7 via Frontend Transport; Tue, 18 Oct 2016 06:14:52 +0000
Received: from fihe3nok0735.emea.nsn-net.net (localhost [127.0.0.1])
	by fihe3nok0735.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	u9I6Ek9M017359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 18 Oct 2016 09:14:46 +0300
Received: from CNU418C7XK.emea.nsn-net.net (CNU402C467.nsn-intra.net
	[10.144.204.51] (may be forged))
	by fihe3nok0735.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	u9I6EjpC017356; Tue, 18 Oct 2016 09:14:46 +0300
X-HPESVCS-Source-Ip: 10.144.204.51
From: <marcin.krzeminski@nokia.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
Date: Tue, 18 Oct 2016 08:14:45 +0200
Message-ID: <1476771285-3680-1-git-send-email-marcin.krzeminski@nokia.com>
X-Mailer: git-send-email 2.7.4
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:131.228.2.241; IPV:NLI; CTRY:FI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(189998001)(86362001)(107886002)(2906002)(19580395003)(4326007)(50986999)(2876002)(36756003)(586003)(19580405001)(48376002)(33646002)(106466001)(47776003)(50466002)(81156014)(81166006)(305945005)(5003940100001)(229853001)(356003)(7846002)(87936001)(4001430100002)(86152002)(8676002)(11100500001)(626004)(68736007)(92566002)(5660300001)(97736004)(50226002)(5001770100001)(77096005)(8936002)(42866002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0701MB2626;
	H:fihe3nok0735.emea.nsn-net.net; FPR:; SPF:Pass;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; AM1FFO11OLC003;
	1:hmGrh4KI7MJ0CqnAj7PM69jlEnPAhbk8chIYhZclhXfJ8tfdr4DhjwNDkehZCzCAMyRw1XZr3/WxxNyMdBjSmOFZtb7vKgVTYisoDYuy12l9S78orYydAuc+2wXDWBzNafLtSRz5I/akP4LCdUzDHVqz5SiA4oRlQWVabfChoEDiRchUrEhYTZlQ/7PyF8Gn/3Ndr/6CxOcKWW5V1xwE/fa7GS4yuob4/RikJNsd7y/xzKibFblNho30m5xg5E0we+d9pe9kVJmjF15tDKqbRxHI0wNgJIGmSPtrHwUsdIfzpo91t0ghhNe3ahQ3aIb4cEkwyRZwf8prALoq5joAIKp23BLeXhwL3xdygKMsu+EZCn+6LvbssDeowDf9vYzw+TIXxYQk8ggh4+8t4wSD00SpKOZ44z2ta2dajQch+aqXB5DBemvzYEXe2ygDqZALcL8wjR+kMj7JS/a2YagfCqyOlkcZgcefl0FywMFV6aUnYPbJm3LJfDxMRZaD6kEm
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fd0cf56c-0177-47cc-1473-08d3f71e129b
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0701MB2626;
	2:7+Qloia5YZ3Nf9bvpjVl51+0vNoT7yqZRT7RrpGPcOCBO/PNwNBaZyz8HSzfsZJW6DJa1814vP0i+Fllj9h3yY5VfKEaf20l0cgm7oph6TJbvloq1+85tiMsDcq/pRRA9HgGstfEDASt0NZpqnw5nIi9X1X4m8CXlxEEgfCSOmrJrnJ76Kgu/CFm+Cvwm7RVQi32U6JtCfhO/cABwN1q1Q==;
	3:CaRFxhA7D5x7flzZiWIXdzMQMph685uNsht7nnaSfGYXv63B9OsUXW6q0mCtA1Kqa43OTxln3HgJcGu0HhadWX7r1QrIIkHyFEwcqGzxpuvRhqGDybFsf33Xt8YfhxIWPU+V1bGbxNZ3WseAsBQZM9zo5B1cHVEAvZ66DHrHXLXVkWRt6Zp5RtaamIL+TV2Q+eseVNaMErbUEg7qLH2Df3e3r8OuYtHPgRiJL9V0IQAtpKtAybt5FyEPYBEoNrbZCets13ExhsALspGauQ7s7tHrXvuIPMwo8rmJLs7zQH0=;
	25:1bziyWW2Tuk23Uftb9I3UyqpYrICJdHg1N27gAKWDGdFvMPLqd/0RbhsDBqRwQ+hNL2J7QbU3tPH/K1LZ39by5BPIxT7GbaIKhTRZJ/vo+1c9USxik4jI/nSrANen56y20D3/Mq68AoyMLf4SP8v+q+f7n4aYi+l0GvdKDpJhZDNmQSn9v5KWlWSlXrZnPj/BoAzksACaoCpYET8IoIKMkVhUjP6IP5Z/PomEzFIRsYj2cJQfEfXOT4EAxK7EgtxTBsCnCWksEqFINcPqmfWUdyqYIiW3+chIFMgWfdV99ZpKkSe7YtAoovFu2A9HaR6Ed3pdMl14zMz4YX1dpGXbpSf8Q1rejWdboqNiSOPeipH/ZnYwsAttZ37SIxIy1YoCHnimUYl2j3KxBuQb6DfEOX+haEzt0ygWfVdinTauvm+MZEiXHuk0CyuZfPrPJkq
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:AM5PR0701MB2626; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0701MB2626;
	31:1p79f+XBcLpwasShnexVSaInMbd0g6pAdeaAgxVUuYTAALjLU+AthTeTM5HTLxFxmy6zYh2vN2oy4OzytrkfnXHhllArKl6+u7cFWUT7b+zAu8fmZVu9PPL8OuZkmgm91tJVaJJ3QRM0h/uNhn5wJIdp1TY2pVwlVLIiZeGqPzPSyT+CCdRHL7a1C0GAxLYZbkGV+cCYyeTU/WL0sNHJzDoNFEa7KZK4BMwDgKBL0BCPmoJyfr613WY+wZ0JIX/yusLCxLbdfmJd+xvsE4zAlg==;
	20:jOvxs4UYglsPC6MwXeNUakph/ccESq9YvL3MIHpToCpMZN/aSR3QpcD+nNK72Dj2YVc/PgG97h0AFuZMBOXU1BB00Nh50fKu6Me4YJ+fLBbzSmBxCS+jMi3ODFzydt4I17fkgnX8lpx67+sGRhYuvwmxvm4iDcyCaDUPdK8Jx+DAT8ltBvk47mZWtx20tMupaCCBf6DgTsDGILwVwQkjKh/9KeS5R1MDDVN7TJAizDaHtmaAGchdC4u1jrWuVP1+Ye2DMgRWxRBjWEuRglU5OZtNInwV6XqC4gyafD7GEGEqMZ0ejNgFjC/nDj+xOi8Q7UFcub4pWr+IKWNJuMaGiPB6S4JJhMmPv5gD1x7sLjanYJjn+6RtYBTuyb4wUcMA/LhQUmwz2YDZpMteUXLzAZqbyt1RXI39jLw8O9NTtZUaEOq+z4gVtuXqcfyAlvp3HpWdFb6QjqvdP5FCJvBWbMxv5FI7DA0NZX+0RJugmonQlJQoFDvFfd9QNg6e0RDmJgEZemyaltwHd2kQDp5G6bWV1/hwIhbR4xnXzJGiRm5BLTNIOL18NfQAEzMpW39XGi2VoNEcO1624Cxv4pDUHKyOriiH1jpM6dzmymlHD7w=
X-Microsoft-Antispam-PRVS: <AM5PR0701MB26261146410382AC8A55EBD1FED30@AM5PR0701MB2626.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(82608151540597);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13016025)(13018025)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:AM5PR0701MB2626; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0701MB2626; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0701MB2626;
	4:VIr5uhFDF9loTVF5yaPX6h13eRviMjhCKRswUixW1CHzlBFgEidgMJyCa/We73Py03aZsjAV3fW4wPTIAV7eOGQcz2SpXBaqioLnFQfI7I+fo8lGEi8mZM6tZ/4DxHZG8Cbkdux5ZMKVJDb4O7A8DpcoQnBHKBNxQHQET+FWQ2esGyP0n54jgZ5tu3PNtG+c5BJtL4QE1Ho5ZlPzPpTiv4PfrgKwGxOGsU66zodTP/xviV5DvWnAKbRypXC77PAMjgCmigjr1WJNR0ldeRiQQarrZWuAaJIbkUYB567C6PEZnyMhF5EUKY3tcLQqx1JEcpkKcj9oXxO2kz77dSq5om4StHQHq4gsICJSVb/k48NL4gRb5GbDtJvHtXICFKZiGGCxVw61MgdG+M2l00oDHbnBmyaD+qs1kpqah+6qllUsZ/MncJ1vwo0yiG8ZGvwM3VezJmNhdu09Y2bdBI+P4mV/YURtJem/+TJBdSluAzNx0WNvd4Hq1i9IoDBBLSiz
X-Forefront-PRVS: 00997889E7
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR0701MB2626;
	23:Pvd3cApGirx00yClj6Aq/J05HECZazV8baFghth?=
	=?us-ascii?Q?cmIAQrrZ0njq6mb8X6m5a8UBn8acYTQ+XVUEuEoLBAbtSriJpr5DqESc0kV7?=
	=?us-ascii?Q?lV8DA6O0MtuBiLzzsVhkXDz3uyR16GvpiQf9UVlY7r6BU/MYatXBj4YIPLBN?=
	=?us-ascii?Q?47ICv0BCGuM6Zka6fbsdLwHimXXHRDPOOAQd8vZcGn58Igc55qLO6VpswQ0C?=
	=?us-ascii?Q?QMDIZ1656HT0heH6yB+afoMcehd9JAh9rO6VjQrNVJhc+Rj1PxRgdLYjNW8m?=
	=?us-ascii?Q?EBrcVKegctEwyIEsq3vRKk9b/e/+ykr28Ds3RZaMhOm86y6Pm64zNu5/XZn7?=
	=?us-ascii?Q?BPeOa97DN5ZS5lphd6RmZa6ttI+xlgrv5MqwgM/Nv3+pNO8Pg4PDL5LCJIis?=
	=?us-ascii?Q?Wr+6laxf+NnGw0Rsr+70FCxLhRx11adAElViUln4Oxo8SNPp4MpSZXAu0xek?=
	=?us-ascii?Q?od0R/SVvyUSFxmM1ioe2YM+DQhuWbA8sW5KcvUvQGiEHw9YFrlwsgPmkk84M?=
	=?us-ascii?Q?KzRDN54o+cpfOnITj+bACE5cr7ctD10OVakHp0k3Iu7Mg1DhoqlQ6fKWSL68?=
	=?us-ascii?Q?Q/wfwr3FnYTDi+W/djafc6mvhkG+I98/ZnSrOO6YmD+3loRZoNnVFbGr5GBI?=
	=?us-ascii?Q?MTya0j4OwTzWiU0BI4TNv1yTk5GruRdRk7i6GJBN7SatBJAJrbKvaQ0pYc2b?=
	=?us-ascii?Q?Bysqs6GPNYcK3iouYiP++V5A2M4DANxmwqyG0kNadLlsjgHiKNjEWsh9M5Ik?=
	=?us-ascii?Q?w+zroFeD2tOKaTx7PqpohdemdHRqzkw5HlnEzN26acO36QTBXkiHTVI5a6vl?=
	=?us-ascii?Q?Ij8pgwbWLvDUrMGEnGdUB/1aqENfhcYnCEKE6qm2B7Sbeto0XaRdYmH2hoLw?=
	=?us-ascii?Q?DgN8dW5g40MVzQFkGqDjqaOo03xpeiT4N3s1N5wIEWh5EI7xUiLqJbAdsGtI?=
	=?us-ascii?Q?AkCYl1Gi4sdpgZBzaDa5SqUbMot9twM45DAdQK1RLsVuCdpYr24clDCV14CV?=
	=?us-ascii?Q?aMCdcaV6vCQT4DfoAbHcNphBcytcAJq2/yh3zmO/bjjiDvagZsjg0AImo2+k?=
	=?us-ascii?Q?C0OaGrZRRndy+NcGpOGBWUitboo1hP9wyV3LG50lSnNzEK6/AxTLdrjOa+nY?=
	=?us-ascii?Q?sfLpZClNdlA4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0701MB2626;
	6:rkgSrvy6AP4uC8P0+JGEjrMal8XjzncehrdWoMXy0Z0xmX4dOYI41JmEPELSq4wBW2OqzEskj7l+fpthMWOv2FkdmDkYSeKd9PniRN61fIfSR4Askt/eU+leSiE96SnOYaa8ML7XlTR9fIPi/H/A/VrbxZmP9tGfJ+qk8yZg9w8fuK0v1g7UBOYJGqf7ZMUD7EWrLSrbcMhX4cvV3UlzHbgTbmNqW6/c4LNHysyp8m3Y2VZrILhTT2RO1Qwx9rapmwpjcPR7rcNRMTF9RPZ8jv+nO3wzCp1AqpcqHWZv8l9ihOudytWebeXI0uVD119x8phqxj+Hbi3JgzHDPCJR9sQ5MPNHZoE+0HZyhouzrmU=;
	5:JpnkCChubF0ImFi5rJnp3gZRyDVQrb9Z7V9AECYQSdoii3W8dx3SxE9oQ3QZo0SubqK05xF2BceA1N9MFX6J68/3D4/uawhkBCk46CtLZt2mfjldrbCpm1XVnLa2aAx/72s6Sepf3tIeU604USJqcg==;
	24:NBfMgoVeTLYjd042d5/8Wuo1xYAYJGAzr5ApJJnjxyZ6sqEUBa6Ci3IpVevIkwfUPL3BZZDnwPRwkxEBrsTXhets6mmjFJUris9fFkQ75Sk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0701MB2626;
	7:55wjqjJgONf0nQos+RnqDUbIXD0EjG7pG78dUdEAms2x3dmYVC0SQuLbPNHMg/Q0/7oDGMtbpN5Y8Qsa+Y+mxg8sMaDfXMTaOCe6FFwiIkDk0quD51CUthovNQ135e42qEUVtj+eQSh039EAmi3LpE9xylUd4DXi0N4XIo5LaMSCgCAY4Gm57VsVQwrXQ7/KmJt56hVph+Yk7Bjum/gQDSA14ECX8VpcnwvjuqJqB6oNPDR7XyeOGw8DtFXu8HjtPsXYckBF2iNH1VCpSQ3gtGuXdz0CX3HD5l5EWsNgSlH/wRwWuDsd4QYqoApIFkMjbTW5pQm6biu0qXLCErsSznTujyZysjUWJxwQQDVcOqI=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2016 06:14:52.1044 (UTC)
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;
	Ip=[131.228.2.241]; Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0701MB2626
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.139
Subject: [Qemu-devel] [v2] nvic: set pending status for not active interrupts
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: rfsw-patches@mlist.nokia.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6nlmyQKbifQB

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

According to ARM DUI 0552A 4.2.10. NVIC set pending status
also for disabled interrupts. This patch adds possibility
to emulate this in Qemu.

Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
---
Changes for v2:
    - add a dedicated unction for nvic
    - update complete_irq
 hw/intc/arm_gic.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index b30cc91..72e4c01 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -156,6 +156,21 @@ static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
     }
 }
 
+static void gic_set_irq_nvic(GICState *s, int irq, int level,
+                                 int cm, int target)
+{
+    if (level) {
+        GIC_SET_LEVEL(irq, cm);
+        if (GIC_TEST_EDGE_TRIGGER(irq) || GIC_TEST_ENABLED(irq, cm)
+                || !GIC_TEST_ACTIVE(irq, cm)) {
+            DPRINTF("Set %d pending mask %x\n", irq, target);
+            GIC_SET_PENDING(irq, target);
+        }
+    } else {
+        GIC_CLEAR_LEVEL(irq, cm);
+    }
+}
+
 static void gic_set_irq_generic(GICState *s, int irq, int level,
                                 int cm, int target)
 {
@@ -201,8 +216,10 @@ static void gic_set_irq(void *opaque, int irq, int level)
         return;
     }
 
-    if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
+    if (s->revision == REV_11MPCORE) {
         gic_set_irq_11mpcore(s, irq, level, cm, target);
+    } else if (s->revision == REV_NVIC) {
+        gic_set_irq_nvic(s, irq, level, cm, target);
     } else {
         gic_set_irq_generic(s, irq, level, cm, target);
     }
@@ -568,7 +585,7 @@ void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
         return; /* No active IRQ.  */
     }
 
-    if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
+    if (s->revision == REV_11MPCORE) {
         /* Mark level triggered interrupts as pending if they are still
            raised.  */
         if (!GIC_TEST_EDGE_TRIGGER(irq) && GIC_TEST_ENABLED(irq, cm)
@@ -576,6 +593,12 @@ void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
             DPRINTF("Set %d pending mask %x\n", irq, cm);
             GIC_SET_PENDING(irq, cm);
         }
+    } else if (s->revision == REV_NVIC) {
+        if (GIC_TEST_ENABLED(irq, cm) && GIC_TEST_LEVEL(irq, cm)
+            && (GIC_TARGET(irq) & cm) != 0) {
+            DPRINTF("Set nvic %d pending mask %x\n", irq, cm);
+            GIC_SET_PENDING(irq, cm);
+        }
     }
 
     group = gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
-- 
2.7.4

